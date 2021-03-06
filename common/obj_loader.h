/******************************************************************************
 * Copyright 1998-2018 NVIDIA Corp. All Rights Reserved.
 *****************************************************************************/

#pragma once
#include "fileformats/tiny_obj_loader.h"
#include "nvmath/nvmath.h"
#include <array>
#include <iostream>
#include <unordered_map>
#include <vector>

// Structure holding the material
struct MaterialObj
{
  //nvmath::vec3f ambient       = nvmath::vec3f(0.1f, 0.1f, 0.1f);
  nvmath::vec3f ambient       = nvmath::vec3f(0.2f, 0.2f, 0.2f);
  //nvmath::vec3f diffuse       = nvmath::vec3f(0.5f, 0.5f, 0.5f);
  nvmath::vec3f diffuse       = nvmath::vec3f(0.8f, 0.0f, 0.0f);
  //nvmath::vec3f diffuse       = nvmath::vec3f( 0.80, 0.89, 0.75);
  //nvmath::vec3f specular      = nvmath::vec3f(1.0f, 1.0f, 1.0f);
  nvmath::vec3f specular      = nvmath::vec3f(0.9f, 0.9f, 0.9f);
  nvmath::vec3f transmittance = nvmath::vec3f(0.0f, 0.0f, 0.0f);
  nvmath::vec3f emission      = nvmath::vec3f(0.0f, 0.0f, 0.0);
  float         shininess     = 0.0f;
  float         ior           = 1.0f;  // index of refraction
  float         dissolve      = 1.f;   // 1 == opaque; 0 == fully transparent
  //float         dissolve      = 0.5f;   // 1 == opaque; 0 == fully transparent
      // illumination model (see http://www.fileformat.info/format/material/)
  //int illum     = 3;
  int illum     = 4;
  int textureID = -1;
};
// OBJ representation of a vertex
struct VertexObj
{
  nvmath::vec3f pos;
  nvmath::vec3f nrm;
  nvmath::vec3f color;
  nvmath::vec2f texCoord;
};


struct shapeObj
{
  uint32_t offset;
  uint32_t nbIndex;
  uint32_t matIndex;
};

class ObjLoader
{
public:
  void loadModel(const std::string& filename);

  std::vector<VertexObj>   m_vertices;
  std::vector<uint32_t>    m_indices;
  std::vector<MaterialObj> m_materials;
  std::vector<std::string> m_textures;
  std::vector<uint32_t>    m_matIndx;
};
