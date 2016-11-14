module Sample where

import Prelude
import Data.StrMap (fromFoldable)
import Data.Tuple

import LambdaCube.Mesh
import LambdaCube.LinearBase

--  Our vertices. Tree consecutive floats give a 3D vertex; Three consecutive vertices give a triangle.
--  A cube has 6 faces with 2 triangles each, so this makes 6*2=12 triangles, and 12*3 vertices
g_vertex_buffer_data =
    [ V4   1.0    1.0  (-1.0) 1.0
    , V4   1.0  (-1.0) (-1.0) 1.0
    , V4 (-1.0) (-1.0) (-1.0) 1.0

    , V4   1.0    1.0  (-1.0) 1.0
    , V4 (-1.0) (-1.0) (-1.0) 1.0
    , V4 (-1.0)   1.0  (-1.0) 1.0

    , V4   1.0    1.0  (-1.0) 1.0
    , V4   1.0    1.0    1.0  1.0
    , V4   1.0  (-1.0)   1.0  1.0

    , V4   1.0    1.0  (-1.0) 1.0
    , V4   1.0  (-1.0)   1.0  1.0
    , V4   1.0  (-1.0) (-1.0) 1.0

    , V4   1.0    1.0    1.0  1.0
    , V4 (-1.0) (-1.0)   1.0  1.0
    , V4   1.0  (-1.0)   1.0  1.0

    , V4   1.0    1.0    1.0  1.0
    , V4 (-1.0)   1.0    1.0  1.0
    , V4 (-1.0) (-1.0)   1.0  1.0

    , V4 (-1.0)   1.0    1.0  1.0
    , V4 (-1.0) (-1.0) (-1.0) 1.0
    , V4 (-1.0) (-1.0)   1.0  1.0

    , V4 (-1.0)   1.0    1.0  1.0
    , V4 (-1.0)   1.0  (-1.0) 1.0
    , V4 (-1.0) (-1.0) (-1.0) 1.0

    , V4   1.0    1.0  (-1.0) 1.0
    , V4 (-1.0)   1.0  (-1.0) 1.0
    , V4 (-1.0)   1.0    1.0  1.0

    , V4   1.0    1.0  (-1.0) 1.0
    , V4 (-1.0)   1.0    1.0  1.0
    , V4   1.0    1.0    1.0  1.0

    , V4   1.0    (-1.0)  (-1.0) 1.0  --* y: 1 => -1
    , V4   1.0    (-1.0)    1.0  1.0
    , V4 (-1.0)   (-1.0)    1.0  1.0

    , V4   1.0    (-1.0)  (-1.0) 1.0  --* y: 1 => -1
    , V4 (-1.0)   (-1.0)    1.0  1.0
    , V4 (-1.0)   (-1.0)  (-1.0) 1.0
    ]

--  Two UV coordinatesfor each vertex. They were created with Blender.
g_uv_buffer_data =
    [ V2 0.0 1.0, V2 0.0 0.0, V2 1.0 0.0
    , V2 0.0 1.0, V2 1.0 0.0, V2 1.0 1.0

    , V2 1.0 1.0, V2 0.0 1.0, V2 0.0 0.0
    , V2 1.0 1.0, V2 0.0 0.0, V2 1.0 0.0

    , V2 1.0 1.0, V2 0.0 0.0, V2 1.0 0.0
    , V2 1.0 1.0, V2 0.0 1.0, V2 0.0 0.0

    , V2 1.0 1.0, V2 0.0 0.0, V2 1.0 0.0
    , V2 1.0 1.0, V2 0.0 1.0, V2 0.0 0.0

    , V2 1.0 1.0, V2 0.0 1.0, V2 0.0 0.0
    , V2 1.0 1.0, V2 0.0 0.0, V2 1.0 0.0

    , V2 0.0 1.0, V2 0.0 0.0, V2 1.0 0.0
    , V2 0.0 1.0, V2 1.0 0.0, V2 1.0 1.0
    ]

myCube :: Mesh
myCube = Mesh
    { mAttributes: fromFoldable
        [ Tuple "position4" (A_V4F g_vertex_buffer_data)
        , Tuple "vertexUV"  (A_V2F g_uv_buffer_data)
        ]
    , mPrimitive: P_Triangles
    }

myCube2 :: Mesh
myCube2 = Mesh
  { mAttributes: fromFoldable
        [ Tuple "normal"    (A_V3F [V3 0.0 1.0 0.0,V3 0.0 1.0 0.0,V3 0.0 1.0 0.0,V3 0.0 1.0 0.0,V3 0.0 1.0 0.0,V3 0.0 1.0 0.0,V3 0.0 (-1.0) 0.0,V3 0.0 (-1.0) 0.0,V3 0.0 (-1.0) 0.0,V3 0.0 (-1.0) 0.0,V3 0.0 (-1.0) 0.0,V3 0.0 (-1.0) 0.0,V3 0.0 (-0.0) 1.0,V3 0.0 (-0.0) 1.0,V3 0.0 (-0.0) 1.0,V3 (-0.0) 0.0 1.0,V3 (-0.0) 0.0 1.0,V3 (-0.0) 0.0 1.0,V3 (-0.0) (-0.0) (-1.0),V3 (-0.0) (-0.0) (-1.0),V3 (-0.0) (-0.0) (-1.0),V3 0.0 0.0 (-1.0),V3 0.0 0.0 (-1.0),V3 0.0 0.0 (-1.0),V3 (-1.0) 0.0 0.0,V3 (-1.0) 0.0 0.0,V3 (-1.0) 0.0 0.0,V3 (-1.0) 0.0 0.0,V3 (-1.0) 0.0 0.0,V3 (-1.0) 0.0 0.0,V3 1.0 0.0 0.0,V3 1.0 0.0 0.0,V3 1.0 0.0 0.0,V3 1.0 0.0 0.0,V3 1.0 0.0 0.0,V3 1.0 0.0 0.0])
        , Tuple "position"  (A_V3F [V3 1.0 1.0 1.0,V3 (-1.0) 1.0 1.0,V3 (-1.0) 1.0 (-1.0),V3 (-1.0) 1.0 (-1.0),V3 1.0 1.0 (-1.0),V3 1.0 1.0 1.0,V3 1.0 (-1.0) (-1.0),V3 (-1.0) (-1.0) (-1.0),V3 (-1.0) (-1.0) 1.0,V3 (-1.0) (-1.0) 1.0,V3 1.0 (-1.0) 1.0,V3 1.0 (-1.0) (-1.0),V3 1.0 (-1.0) 1.0,V3 (-1.0) (-1.0) 1.0,V3 (-1.0) 1.0 1.0,V3 (-1.0) 1.0 1.0,V3 1.0 1.0 1.0,V3 1.0 (-1.0) 1.0,V3 1.0 1.0 (-1.0),V3 (-1.0) 1.0 (-1.0),V3 (-1.0) (-1.0) (-1.0),V3 (-1.0) (-1.0) (-1.0),V3 1.0 (-1.0) (-1.0),V3 1.0 1.0 (-1.0),V3 (-1.0) (-1.0) 1.0,V3 (-1.0) (-1.0) (-1.0),V3 (-1.0) 1.0 (-1.0),V3 (-1.0) 1.0 (-1.0),V3 (-1.0) 1.0 1.0,V3 (-1.0) (-1.0) 1.0,V3 1.0 (-1.0) (-1.0),V3 1.0 (-1.0) 1.0,V3 1.0 1.0 1.0,V3 1.0 1.0 1.0,V3 1.0 1.0 (-1.0),V3 1.0 (-1.0) (-1.0)])
        ]
  , mPrimitive: P_Triangles
  }

myQuad :: Mesh
myQuad = Mesh
  { mAttributes: fromFoldable
      [ Tuple "position" (A_V2F [V2 (-1.0) 1.0,V2 (-1.0) (-1.0),V2 1.0 (-1.0),V2 1.0 (-1.0),V2 1.0 1.0,V2 (-1.0) 1.0])]
  , mPrimitive: P_Triangles
  }

lambdaCube :: Mesh
lambdaCube = Mesh
    { mAttributes: fromFoldable
        [ Tuple "position"  (A_V3F lambdaCubeVertices)
        , Tuple "normal"    (A_V3F lambdaCubeNormals)
        ]
    , mPrimitive: P_Triangles
    }

lambdaCubeVertices =
  [ V3 5.000 (-5.000) (-4.000)
  , V3 5.000 (-4.000) (-4.000)
  , V3 (-5.000) (-4.000) (-4.000)
  , V3 5.000 (-5.000) (-4.000)
  , V3 (-5.000) (-4.000) (-4.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 5.000 (-4.000) (-4.000)
  , V3 5.000 (-4.000) (-5.000)
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 5.000 (-4.000) (-4.000)
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 (-5.000) (-4.000) (-4.000)
  , V3 5.000 (-4.000) (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 5.000 (-4.000) (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 (-5.000) (-4.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 (-5.000) (-4.000) (-4.000)
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 (-4.000) (-5.000)
  , V3 5.000 (-4.000) (-4.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 (-4.000) (-4.000)
  , V3 5.000 (-5.000) (-4.000)
  , V3 5.000 4.000 (-4.000)
  , V3 5.000 5.000 (-4.000)
  , V3 (-5.000) 5.000 (-4.000)
  , V3 5.000 4.000 (-4.000)
  , V3 (-5.000) 5.000 (-4.000)
  , V3 (-5.000) 4.000 (-4.000)
  , V3 5.000 5.000 (-4.000)
  , V3 5.000 5.000 (-5.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 5.000 5.000 (-4.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) 5.000 (-4.000)
  , V3 5.000 5.000 (-5.000)
  , V3 5.000 4.000 (-5.000)
  , V3 (-5.000) 4.000 (-5.000)
  , V3 5.000 5.000 (-5.000)
  , V3 (-5.000) 4.000 (-5.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 5.000 4.000 (-5.000)
  , V3 5.000 4.000 (-4.000)
  , V3 (-5.000) 4.000 (-4.000)
  , V3 5.000 4.000 (-5.000)
  , V3 (-5.000) 4.000 (-4.000)
  , V3 (-5.000) 4.000 (-5.000)
  , V3 (-5.000) 4.000 (-4.000)
  , V3 (-5.000) 5.000 (-4.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) 4.000 (-4.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) 4.000 (-5.000)
  , V3 5.000 4.000 (-5.000)
  , V3 5.000 5.000 (-5.000)
  , V3 5.000 5.000 (-4.000)
  , V3 5.000 4.000 (-5.000)
  , V3 5.000 5.000 (-4.000)
  , V3 5.000 4.000 (-4.000)
  , V3 5.000 4.000 5.000
  , V3 5.000 5.000 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 5.000 4.000 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-5.000) 4.000 5.000
  , V3 5.000 5.000 5.000
  , V3 5.000 5.000 4.000
  , V3 (-5.000) 5.000 4.000
  , V3 5.000 5.000 5.000
  , V3 (-5.000) 5.000 4.000
  , V3 (-5.000) 5.000 5.000
  , V3 5.000 5.000 4.000
  , V3 5.000 4.000 4.000
  , V3 (-5.000) 4.000 4.000
  , V3 5.000 5.000 4.000
  , V3 (-5.000) 4.000 4.000
  , V3 (-5.000) 5.000 4.000
  , V3 5.000 4.000 4.000
  , V3 5.000 4.000 5.000
  , V3 (-5.000) 4.000 5.000
  , V3 5.000 4.000 4.000
  , V3 (-5.000) 4.000 5.000
  , V3 (-5.000) 4.000 4.000
  , V3 (-5.000) 4.000 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-5.000) 5.000 4.000
  , V3 (-5.000) 4.000 5.000
  , V3 (-5.000) 5.000 4.000
  , V3 (-5.000) 4.000 4.000
  , V3 5.000 4.000 4.000
  , V3 5.000 5.000 4.000
  , V3 5.000 5.000 5.000
  , V3 5.000 4.000 4.000
  , V3 5.000 5.000 5.000
  , V3 5.000 4.000 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 5.000 (-4.000) 5.000
  , V3 (-5.000) (-4.000) 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 (-5.000) (-4.000) 5.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 5.000 (-4.000) 5.000
  , V3 5.000 (-4.000) 4.000
  , V3 (-5.000) (-4.000) 4.000
  , V3 5.000 (-4.000) 5.000
  , V3 (-5.000) (-4.000) 4.000
  , V3 (-5.000) (-4.000) 5.000
  , V3 5.000 (-4.000) 4.000
  , V3 5.000 (-5.000) 4.000
  , V3 (-5.000) (-5.000) 4.000
  , V3 5.000 (-4.000) 4.000
  , V3 (-5.000) (-5.000) 4.000
  , V3 (-5.000) (-4.000) 4.000
  , V3 5.000 (-5.000) 4.000
  , V3 5.000 (-5.000) 5.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 5.000 (-5.000) 4.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) (-5.000) 4.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) (-4.000) 5.000
  , V3 (-5.000) (-4.000) 4.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) (-4.000) 4.000
  , V3 (-5.000) (-5.000) 4.000
  , V3 5.000 (-5.000) 4.000
  , V3 5.000 (-4.000) 4.000
  , V3 5.000 (-4.000) 5.000
  , V3 5.000 (-5.000) 4.000
  , V3 5.000 (-4.000) 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 (-4.000) (-5.000) (-4.000)
  , V3 (-4.000) 5.000 (-4.000)
  , V3 (-5.000) 5.000 (-4.000)
  , V3 (-4.000) (-5.000) (-4.000)
  , V3 (-5.000) 5.000 (-4.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 (-4.000) 5.000 (-4.000)
  , V3 (-4.000) 5.000 (-5.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-4.000) 5.000 (-4.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) 5.000 (-4.000)
  , V3 (-4.000) 5.000 (-5.000)
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-4.000) 5.000 (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-4.000) (-5.000) (-4.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 (-5.000) 5.000 (-4.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) (-5.000) (-4.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-4.000) 5.000 (-5.000)
  , V3 (-4.000) 5.000 (-4.000)
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-4.000) 5.000 (-4.000)
  , V3 (-4.000) (-5.000) (-4.000)
  , V3 (-4.000) (-5.000) 5.000
  , V3 (-4.000) 5.000 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-4.000) (-5.000) 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-4.000) 5.000 5.000
  , V3 (-4.000) 5.000 4.000
  , V3 (-5.000) 5.000 4.000
  , V3 (-4.000) 5.000 5.000
  , V3 (-5.000) 5.000 4.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-4.000) 5.000 4.000
  , V3 (-4.000) (-5.000) 4.000
  , V3 (-5.000) (-5.000) 4.000
  , V3 (-4.000) 5.000 4.000
  , V3 (-5.000) (-5.000) 4.000
  , V3 (-5.000) 5.000 4.000
  , V3 (-4.000) (-5.000) 4.000
  , V3 (-4.000) (-5.000) 5.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-4.000) (-5.000) 4.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) (-5.000) 4.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-5.000) 5.000 4.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) 5.000 4.000
  , V3 (-5.000) (-5.000) 4.000
  , V3 (-4.000) (-5.000) 4.000
  , V3 (-4.000) 5.000 4.000
  , V3 (-4.000) 5.000 5.000
  , V3 (-4.000) (-5.000) 4.000
  , V3 (-4.000) 5.000 5.000
  , V3 (-4.000) (-5.000) 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 5.000 5.000 5.000
  , V3 4.000 5.000 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 4.000 5.000 5.000
  , V3 4.000 (-5.000) 5.000
  , V3 5.000 5.000 5.000
  , V3 5.000 5.000 4.000
  , V3 4.000 5.000 4.000
  , V3 5.000 5.000 5.000
  , V3 4.000 5.000 4.000
  , V3 4.000 5.000 5.000
  , V3 5.000 5.000 4.000
  , V3 5.000 (-5.000) 4.000
  , V3 4.000 (-5.000) 4.000
  , V3 5.000 5.000 4.000
  , V3 4.000 (-5.000) 4.000
  , V3 4.000 5.000 4.000
  , V3 5.000 (-5.000) 4.000
  , V3 5.000 (-5.000) 5.000
  , V3 4.000 (-5.000) 5.000
  , V3 5.000 (-5.000) 4.000
  , V3 4.000 (-5.000) 5.000
  , V3 4.000 (-5.000) 4.000
  , V3 4.000 (-5.000) 5.000
  , V3 4.000 5.000 5.000
  , V3 4.000 5.000 4.000
  , V3 4.000 (-5.000) 5.000
  , V3 4.000 5.000 4.000
  , V3 4.000 (-5.000) 4.000
  , V3 5.000 (-5.000) 4.000
  , V3 5.000 5.000 4.000
  , V3 5.000 5.000 5.000
  , V3 5.000 (-5.000) 4.000
  , V3 5.000 5.000 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 5.000 (-5.000) (-4.000)
  , V3 5.000 5.000 (-4.000)
  , V3 4.000 5.000 (-4.000)
  , V3 5.000 (-5.000) (-4.000)
  , V3 4.000 5.000 (-4.000)
  , V3 4.000 (-5.000) (-4.000)
  , V3 5.000 5.000 (-4.000)
  , V3 5.000 5.000 (-5.000)
  , V3 4.000 5.000 (-5.000)
  , V3 5.000 5.000 (-4.000)
  , V3 4.000 5.000 (-5.000)
  , V3 4.000 5.000 (-4.000)
  , V3 5.000 5.000 (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 4.000 (-5.000) (-5.000)
  , V3 5.000 5.000 (-5.000)
  , V3 4.000 (-5.000) (-5.000)
  , V3 4.000 5.000 (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 (-5.000) (-4.000)
  , V3 4.000 (-5.000) (-4.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 4.000 (-5.000) (-4.000)
  , V3 4.000 (-5.000) (-5.000)
  , V3 4.000 (-5.000) (-4.000)
  , V3 4.000 5.000 (-4.000)
  , V3 4.000 5.000 (-5.000)
  , V3 4.000 (-5.000) (-4.000)
  , V3 4.000 5.000 (-5.000)
  , V3 4.000 (-5.000) (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 5.000 (-5.000)
  , V3 5.000 5.000 (-4.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 5.000 (-4.000)
  , V3 5.000 (-5.000) (-4.000)
  , V3 (-4.000) (-5.000) 5.000
  , V3 (-4.000) (-4.000) 5.000
  , V3 (-5.000) (-4.000) 5.000
  , V3 (-4.000) (-5.000) 5.000
  , V3 (-5.000) (-4.000) 5.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-4.000) (-4.000) 5.000
  , V3 (-4.000) (-4.000) (-5.000)
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 (-4.000) (-4.000) 5.000
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 (-5.000) (-4.000) 5.000
  , V3 (-4.000) (-4.000) (-5.000)
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-4.000) (-4.000) (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-4.000) (-5.000) 5.000
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) (-4.000) 5.000
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 (-5.000) (-5.000) 5.000
  , V3 (-5.000) (-4.000) (-5.000)
  , V3 (-5.000) (-5.000) (-5.000)
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-4.000) (-4.000) (-5.000)
  , V3 (-4.000) (-4.000) 5.000
  , V3 (-4.000) (-5.000) (-5.000)
  , V3 (-4.000) (-4.000) 5.000
  , V3 (-4.000) (-5.000) 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 5.000 (-4.000) 5.000
  , V3 4.000 (-4.000) 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 4.000 (-4.000) 5.000
  , V3 4.000 (-5.000) 5.000
  , V3 5.000 (-4.000) 5.000
  , V3 5.000 (-4.000) (-5.000)
  , V3 4.000 (-4.000) (-5.000)
  , V3 5.000 (-4.000) 5.000
  , V3 4.000 (-4.000) (-5.000)
  , V3 4.000 (-4.000) 5.000
  , V3 5.000 (-4.000) (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 4.000 (-5.000) (-5.000)
  , V3 5.000 (-4.000) (-5.000)
  , V3 4.000 (-5.000) (-5.000)
  , V3 4.000 (-4.000) (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 (-5.000) 5.000
  , V3 4.000 (-5.000) 5.000
  , V3 5.000 (-5.000) (-5.000)
  , V3 4.000 (-5.000) 5.000
  , V3 4.000 (-5.000) (-5.000)
  , V3 4.000 (-5.000) 5.000
  , V3 4.000 (-4.000) 5.000
  , V3 4.000 (-4.000) (-5.000)
  , V3 4.000 (-5.000) 5.000
  , V3 4.000 (-4.000) (-5.000)
  , V3 4.000 (-5.000) (-5.000)
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 (-4.000) (-5.000)
  , V3 5.000 (-4.000) 5.000
  , V3 5.000 (-5.000) (-5.000)
  , V3 5.000 (-4.000) 5.000
  , V3 5.000 (-5.000) 5.000
  , V3 5.000 4.000 5.000
  , V3 5.000 5.000 5.000
  , V3 4.000 5.000 5.000
  , V3 5.000 4.000 5.000
  , V3 4.000 5.000 5.000
  , V3 4.000 4.000 5.000
  , V3 5.000 5.000 5.000
  , V3 5.000 5.000 (-5.000)
  , V3 4.000 5.000 (-5.000)
  , V3 5.000 5.000 5.000
  , V3 4.000 5.000 (-5.000)
  , V3 4.000 5.000 5.000
  , V3 5.000 5.000 (-5.000)
  , V3 5.000 4.000 (-5.000)
  , V3 4.000 4.000 (-5.000)
  , V3 5.000 5.000 (-5.000)
  , V3 4.000 4.000 (-5.000)
  , V3 4.000 5.000 (-5.000)
  , V3 5.000 4.000 (-5.000)
  , V3 5.000 4.000 5.000
  , V3 4.000 4.000 5.000
  , V3 5.000 4.000 (-5.000)
  , V3 4.000 4.000 5.000
  , V3 4.000 4.000 (-5.000)
  , V3 4.000 4.000 5.000
  , V3 4.000 5.000 5.000
  , V3 4.000 5.000 (-5.000)
  , V3 4.000 4.000 5.000
  , V3 4.000 5.000 (-5.000)
  , V3 4.000 4.000 (-5.000)
  , V3 5.000 4.000 (-5.000)
  , V3 5.000 5.000 (-5.000)
  , V3 5.000 5.000 5.000
  , V3 5.000 4.000 (-5.000)
  , V3 5.000 5.000 5.000
  , V3 5.000 4.000 5.000
  , V3 (-4.000) 4.000 5.000
  , V3 (-4.000) 5.000 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-4.000) 4.000 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-5.000) 4.000 5.000
  , V3 (-4.000) 5.000 5.000
  , V3 (-4.000) 5.000 (-5.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-4.000) 5.000 5.000
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) 5.000 5.000
  , V3 (-4.000) 5.000 (-5.000)
  , V3 (-4.000) 4.000 (-5.000)
  , V3 (-5.000) 4.000 (-5.000)
  , V3 (-4.000) 5.000 (-5.000)
  , V3 (-5.000) 4.000 (-5.000)
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-4.000) 4.000 (-5.000)
  , V3 (-4.000) 4.000 5.000
  , V3 (-5.000) 4.000 5.000
  , V3 (-4.000) 4.000 (-5.000)
  , V3 (-5.000) 4.000 5.000
  , V3 (-5.000) 4.000 (-5.000)
  , V3 (-5.000) 4.000 5.000
  , V3 (-5.000) 5.000 5.000
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) 4.000 5.000
  , V3 (-5.000) 5.000 (-5.000)
  , V3 (-5.000) 4.000 (-5.000)
  , V3 (-4.000) 4.000 (-5.000)
  , V3 (-4.000) 5.000 (-5.000)
  , V3 (-4.000) 5.000 5.000
  , V3 (-4.000) 4.000 (-5.000)
  , V3 (-4.000) 5.000 5.000
  , V3 (-4.000) 4.000 5.000
  , V3 4.596 3.889 (-4.000)
  , V3 3.889 4.596 (-4.000)
  , V3 (-4.596) (-3.889) (-4.000)
  , V3 4.596 3.889 (-4.000)
  , V3 (-4.596) (-3.889) (-4.000)
  , V3 (-3.889) (-4.596) (-4.000)
  , V3 3.889 4.596 (-4.000)
  , V3 3.889 4.596 (-5.000)
  , V3 (-4.596) (-3.889) (-5.000)
  , V3 3.889 4.596 (-4.000)
  , V3 (-4.596) (-3.889) (-5.000)
  , V3 (-4.596) (-3.889) (-4.000)
  , V3 3.889 4.596 (-5.000)
  , V3 4.596 3.889 (-5.000)
  , V3 (-3.889) (-4.596) (-5.000)
  , V3 3.889 4.596 (-5.000)
  , V3 (-3.889) (-4.596) (-5.000)
  , V3 (-4.596) (-3.889) (-5.000)
  , V3 4.596 3.889 (-5.000)
  , V3 4.596 3.889 (-4.000)
  , V3 (-3.889) (-4.596) (-4.000)
  , V3 4.596 3.889 (-5.000)
  , V3 (-3.889) (-4.596) (-4.000)
  , V3 (-3.889) (-4.596) (-5.000)
  , V3 (-3.889) (-4.596) (-4.000)
  , V3 (-4.596) (-3.889) (-4.000)
  , V3 (-4.596) (-3.889) (-5.000)
  , V3 (-3.889) (-4.596) (-4.000)
  , V3 (-4.596) (-3.889) (-5.000)
  , V3 (-3.889) (-4.596) (-5.000)
  , V3 4.596 3.889 (-5.000)
  , V3 3.889 4.596 (-5.000)
  , V3 3.889 4.596 (-4.000)
  , V3 4.596 3.889 (-5.000)
  , V3 3.889 4.596 (-4.000)
  , V3 4.596 3.889 (-4.000)
  , V3 3.889 (-4.596) (-4.000)
  , V3 4.596 (-3.889) (-4.000)
  , V3 (-3.889) 4.596 (-4.000)
  , V3 3.889 (-4.596) (-4.000)
  , V3 (-3.889) 4.596 (-4.000)
  , V3 (-4.596) 3.889 (-4.000)
  , V3 4.596 (-3.889) (-4.000)
  , V3 4.596 (-3.889) (-5.000)
  , V3 (-3.889) 4.596 (-5.000)
  , V3 4.596 (-3.889) (-4.000)
  , V3 (-3.889) 4.596 (-5.000)
  , V3 (-3.889) 4.596 (-4.000)
  , V3 4.596 (-3.889) (-5.000)
  , V3 3.889 (-4.596) (-5.000)
  , V3 (-4.596) 3.889 (-5.000)
  , V3 4.596 (-3.889) (-5.000)
  , V3 (-4.596) 3.889 (-5.000)
  , V3 (-3.889) 4.596 (-5.000)
  , V3 3.889 (-4.596) (-5.000)
  , V3 3.889 (-4.596) (-4.000)
  , V3 (-4.596) 3.889 (-4.000)
  , V3 3.889 (-4.596) (-5.000)
  , V3 (-4.596) 3.889 (-4.000)
  , V3 (-4.596) 3.889 (-5.000)
  , V3 (-4.596) 3.889 (-4.000)
  , V3 (-3.889) 4.596 (-4.000)
  , V3 (-3.889) 4.596 (-5.000)
  , V3 (-4.596) 3.889 (-4.000)
  , V3 (-3.889) 4.596 (-5.000)
  , V3 (-4.596) 3.889 (-5.000)
  , V3 3.889 (-4.596) (-5.000)
  , V3 4.596 (-3.889) (-5.000)
  , V3 4.596 (-3.889) (-4.000)
  , V3 3.889 (-4.596) (-5.000)
  , V3 4.596 (-3.889) (-4.000)
  , V3 3.889 (-4.596) (-4.000)
  , V3 0.500 (-0.500) (-5.000)
  , V3 0.500 0.500 (-5.000)
  , V3 (-0.500) 0.500 (-5.000)
  , V3 0.500 (-0.500) (-5.000)
  , V3 (-0.500) 0.500 (-5.000)
  , V3 (-0.500) (-0.500) (-5.000)
  , V3 0.500 0.500 (-5.000)
  , V3 0.500 0.500 (-7.000)
  , V3 (-0.500) 0.500 (-7.000)
  , V3 0.500 0.500 (-5.000)
  , V3 (-0.500) 0.500 (-7.000)
  , V3 (-0.500) 0.500 (-5.000)
  , V3 0.500 0.500 (-7.000)
  , V3 0.500 (-0.500) (-7.000)
  , V3 (-0.500) (-0.500) (-7.000)
  , V3 0.500 0.500 (-7.000)
  , V3 (-0.500) (-0.500) (-7.000)
  , V3 (-0.500) 0.500 (-7.000)
  , V3 0.500 (-0.500) (-7.000)
  , V3 0.500 (-0.500) (-5.000)
  , V3 (-0.500) (-0.500) (-5.000)
  , V3 0.500 (-0.500) (-7.000)
  , V3 (-0.500) (-0.500) (-5.000)
  , V3 (-0.500) (-0.500) (-7.000)
  , V3 (-0.500) (-0.500) (-5.000)
  , V3 (-0.500) 0.500 (-5.000)
  , V3 (-0.500) 0.500 (-7.000)
  , V3 (-0.500) (-0.500) (-5.000)
  , V3 (-0.500) 0.500 (-7.000)
  , V3 (-0.500) (-0.500) (-7.000)
  , V3 0.500 (-0.500) (-7.000)
  , V3 0.500 0.500 (-7.000)
  , V3 0.500 0.500 (-5.000)
  , V3 0.500 (-0.500) (-7.000)
  , V3 0.500 0.500 (-5.000)
  , V3 0.500 (-0.500) (-5.000)
  , V3 3.134 (-7.428) (-6.000)
  , V3 4.866 (-6.428) (-6.000)
  , V3 (-3.134) 7.428 (-6.000)
  , V3 3.134 (-7.428) (-6.000)
  , V3 (-3.134) 7.428 (-6.000)
  , V3 (-4.866) 6.428 (-6.000)
  , V3 4.866 (-6.428) (-6.000)
  , V3 4.866 (-6.428) (-8.000)
  , V3 (-3.134) 7.428 (-8.000)
  , V3 4.866 (-6.428) (-6.000)
  , V3 (-3.134) 7.428 (-8.000)
  , V3 (-3.134) 7.428 (-6.000)
  , V3 4.866 (-6.428) (-8.000)
  , V3 3.134 (-7.428) (-8.000)
  , V3 (-4.866) 6.428 (-8.000)
  , V3 4.866 (-6.428) (-8.000)
  , V3 (-4.866) 6.428 (-8.000)
  , V3 (-3.134) 7.428 (-8.000)
  , V3 3.134 (-7.428) (-8.000)
  , V3 3.134 (-7.428) (-6.000)
  , V3 (-4.866) 6.428 (-6.000)
  , V3 3.134 (-7.428) (-8.000)
  , V3 (-4.866) 6.428 (-6.000)
  , V3 (-4.866) 6.428 (-8.000)
  , V3 (-4.866) 6.428 (-6.000)
  , V3 (-3.134) 7.428 (-6.000)
  , V3 (-3.134) 7.428 (-8.000)
  , V3 (-4.866) 6.428 (-6.000)
  , V3 (-3.134) 7.428 (-8.000)
  , V3 (-4.866) 6.428 (-8.000)
  , V3 3.134 (-7.428) (-8.000)
  , V3 4.866 (-6.428) (-8.000)
  , V3 4.866 (-6.428) (-6.000)
  , V3 3.134 (-7.428) (-8.000)
  , V3 4.866 (-6.428) (-6.000)
  , V3 3.134 (-7.428) (-6.000)
  , V3 1.366 (-0.536) (-6.000)
  , V3 (-0.366) 0.464 (-6.000)
  , V3 (-4.366) (-6.464) (-6.000)
  , V3 1.366 (-0.536) (-6.000)
  , V3 (-4.366) (-6.464) (-6.000)
  , V3 (-2.634) (-7.464) (-6.000)
  , V3 (-0.366) 0.464 (-6.000)
  , V3 (-0.366) 0.464 (-8.000)
  , V3 (-4.366) (-6.464) (-8.000)
  , V3 (-0.366) 0.464 (-6.000)
  , V3 (-4.366) (-6.464) (-8.000)
  , V3 (-4.366) (-6.464) (-6.000)
  , V3 (-0.366) 0.464 (-8.000)
  , V3 1.366 (-0.536) (-8.000)
  , V3 (-2.634) (-7.464) (-8.000)
  , V3 (-0.366) 0.464 (-8.000)
  , V3 (-2.634) (-7.464) (-8.000)
  , V3 (-4.366) (-6.464) (-8.000)
  , V3 1.366 (-0.536) (-8.000)
  , V3 1.366 (-0.536) (-6.000)
  , V3 (-2.634) (-7.464) (-6.000)
  , V3 1.366 (-0.536) (-8.000)
  , V3 (-2.634) (-7.464) (-6.000)
  , V3 (-2.634) (-7.464) (-8.000)
  , V3 (-2.634) (-7.464) (-6.000)
  , V3 (-4.366) (-6.464) (-6.000)
  , V3 (-4.366) (-6.464) (-8.000)
  , V3 (-2.634) (-7.464) (-6.000)
  , V3 (-4.366) (-6.464) (-8.000)
  , V3 (-2.634) (-7.464) (-8.000)
  , V3 1.366 (-0.536) (-8.000)
  , V3 (-0.366) 0.464 (-8.000)
  , V3 (-0.366) 0.464 (-6.000)
  , V3 1.366 (-0.536) (-8.000)
  , V3 (-0.366) 0.464 (-6.000)
  , V3 1.366 (-0.536) (-6.000)
  ]

lambdaCubeNormals =
  [ V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.707 0.707 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) (-0.707) 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 (-0.707) 0.707 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.707 (-0.707) 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 1.000 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 0.000 (-1.000) 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 (-1.000) 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 1.000 0.000 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.866 0.500 0.000
  , V3 0.866 0.500 0.000
  , V3 0.866 0.500 0.000
  , V3 0.866 0.500 0.000
  , V3 0.866 0.500 0.000
  , V3 0.866 0.500 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 (-0.866) (-0.500) 0.000
  , V3 (-0.866) (-0.500) 0.000
  , V3 (-0.866) (-0.500) 0.000
  , V3 (-0.866) (-0.500) 0.000
  , V3 (-0.866) (-0.500) 0.000
  , V3 (-0.866) (-0.500) 0.000
  , V3 (-0.500) 0.866 0.000
  , V3 (-0.500) 0.866 0.000
  , V3 (-0.500) 0.866 0.000
  , V3 (-0.500) 0.866 0.000
  , V3 (-0.500) 0.866 0.000
  , V3 (-0.500) 0.866 0.000
  , V3 0.500 (-0.866) 0.000
  , V3 0.500 (-0.866) 0.000
  , V3 0.500 (-0.866) 0.000
  , V3 0.500 (-0.866) 0.000
  , V3 0.500 (-0.866) 0.000
  , V3 0.500 (-0.866) 0.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 0.000 0.000 1.000
  , V3 (-0.866) 0.500 0.000
  , V3 (-0.866) 0.500 0.000
  , V3 (-0.866) 0.500 0.000
  , V3 (-0.866) 0.500 0.000
  , V3 (-0.866) 0.500 0.000
  , V3 (-0.866) 0.500 0.000
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.000 0.000 (-1.000)
  , V3 0.866 (-0.500) 0.000
  , V3 0.866 (-0.500) 0.000
  , V3 0.866 (-0.500) 0.000
  , V3 0.866 (-0.500) 0.000
  , V3 0.866 (-0.500) 0.000
  , V3 0.866 (-0.500) 0.000
  , V3 (-0.500) (-0.866) 0.000
  , V3 (-0.500) (-0.866) 0.000
  , V3 (-0.500) (-0.866) 0.000
  , V3 (-0.500) (-0.866) 0.000
  , V3 (-0.500) (-0.866) 0.000
  , V3 (-0.500) (-0.866) 0.000
  , V3 0.500 0.866 0.000
  , V3 0.500 0.866 0.000
  , V3 0.500 0.866 0.000
  , V3 0.500 0.866 0.000
  , V3 0.500 0.866 0.000
  , V3 0.500 0.866 0.000
  ]
