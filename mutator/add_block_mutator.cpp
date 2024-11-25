#include "afl-fuzz.h"
#include <string>

struct MutatorData {
  afl_state_t* afl;
  char* mutated_out;
};

static const std::string geometry_statements[] = {

  "areas {\n", 
  "bars {\n", 
  "errorbars {\n", 
  "labels {\n", 
  "lines {\n", 
  "points {\n", 
  "polygons {\n", 
  "rectangles {\n", 
  "vectors {\n"

};

static const std::string scales[] = {

  "linear",
  "log",
  "logarithmic",
  "invert",
  "inverted"

};

static const char hexstrings[] = "0123456789abcdef";

static const int max_data_number = 100;
static const uint max_data_amount = 100;

extern "C" MutatorData* afl_custom_init(afl_state_t* afl, unsigned int seed) {

  srand(seed);

  MutatorData* data = new MutatorData;
  if (!data) {

    perror("afl_custom_init alloc");
    return NULL;

  }

  if ((data->mutated_out = (char*)malloc(MAX_FILE)) == NULL) {

    perror("afl_custom_init malloc");
    return NULL;

  }

  data->afl = afl;

  return data;

}


/// @brief Return a random integer between -max_data_number and max_data_number
/// @return String representing the integer
std::string get_random_data_number_string() {
  return std::to_string(rand() % (2 * max_data_number) - max_data_number);
}

/// @brief Generates string of random data-x and data-y formatted correctly
/// @return Generated string
std::string get_datas_string() {
  std::string datas_string;
  datas_string += "data-x: list(";

  uint data_size = rand() % max_data_amount;

  datas_string += get_random_data_number_string();
  for (uint i = 0; i < data_size; ++i) {
    datas_string += " ";
    datas_string += get_random_data_number_string();
  }
  datas_string += ");\n";
  
  datas_string += "data-y: list(";

  datas_string += get_random_data_number_string();
  for (uint i = 0; i < data_size; ++i) {
    datas_string += " ";
    datas_string += get_random_data_number_string();
  }
  datas_string += ");\n";

  return datas_string;
};

/// @brief Generates string of color in hex format with 3 symbols
std::string color_hex3() {
  std::string out = "#";
  uint color = rand() % 4096;
  for (char i = 0; i < 3; ++i) {
    out += hexstrings[color % 16];
    color /= 16;
  }
  return out;
}

/// @brief Generates string of color in hex format with 6 symbols
std::string color_hex6() {
  std::string out = "#";
  uint color = rand() % 16777216;
  for (char i = 0; i < 6; ++i) {
    out += hexstrings[color % 16];
    color /= 16;
  }
  return out;
}

/// @brief Generates string of color in rgb format
std::string color_rgb() {
  std::string out = "rgb(";
  out += std::to_string(static_cast<float>(rand()) / static_cast<float>(RAND_MAX));
  for (char i = 0; i < 3; ++i) {
    out += ", ";
    out += std::to_string(static_cast<float>(rand()) / static_cast<float>(RAND_MAX));
  }
  out += ")";
  return out;
}

/// @brief Generates string of color in rgba format
std::string color_rgba() {
  std::string out = "rgba(";
  out += std::to_string(static_cast<float>(rand()) / static_cast<float>(RAND_MAX));
  for (char i = 0; i < 4; ++i) {
    out += ", ";
    out += std::to_string(static_cast<float>(rand()) / static_cast<float>(RAND_MAX));
  }
  out += ")";
  return out;
}


/// @brief Generates string of color in one of four formats: rgb, rgba, hex3, hex6
std::string get_color_string() {
  switch (rand() % 4)
  {
  case 0:
    return color_hex3();
    break;
  case 1:
    return color_hex6();
    break;
  case 2:
    return color_rgb();
    break;
  default:
    return color_rgba();
    break;
  }
}

/// @brief Generates a random block of formatted input graph
/// @return The string of generated block
std::string get_random_code_block() {
  std::string out = "\n\n";
  geometry_statements[rand() % 9];

  out += get_datas_string();

  if (rand() % 2 == 0) {
    out += "color: ";
    out += get_color_string();
    out += ";\n";
  }
  
  if (rand() % 2 == 0) {
    out += "color-map: gradient(0.0 ";
    out += get_color_string() + " ";
    out += "1.0 ";
    out += get_color_string() + ");\n";
  }

  if (rand() % 4 == 0) {
    out += "scale-x: ";
    out += scales[rand() % 5];
    out += ";\n";
  }

  if (rand() % 4 == 0) {
    out += "scale-y: ";
    out += scales[rand() % 5];
    out += ";\n";
  }

  if (rand() % 4 == 0) {
    out += "limit-y: ";
    out += get_random_data_number_string();
    out += " ";
    out += get_random_data_number_string();
    out += ";\n";
  }

  if (rand() % 4 == 0) {
    out += "limit-x: ";
    out += get_random_data_number_string();
    out += " ";
    out += get_random_data_number_string();
    out += ";\n";
  }

  out += "}";
  return out;
}


extern "C" size_t afl_custom_fuzz(MutatorData* data, char* buf, size_t buf_size,
                       char** out_buf, char* add_buf,
                       size_t add_buf_size,  // add_buf can be NULL
                       size_t max_size) {

  memcpy(data->mutated_out, buf, buf_size);

  std::string code_block = get_random_code_block();
  if (code_block.size() + buf_size >= max_size) {
    memcpy(*out_buf, buf, buf_size);
    return buf_size;
  }
  memcpy(data->mutated_out + buf_size, code_block.data(), code_block.size());
  
  *out_buf = data->mutated_out;
  return code_block.size() + buf_size;
}

extern "C" void afl_custom_deinit(MutatorData* data) {

  free(data->mutated_out);
  free(data);

}