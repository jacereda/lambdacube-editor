module DefaultText where

defaultSrc = """
dark = V4F 0.1 0.0 0.2 1
clear = FrameBuffer $ (DepthImage @1 1000, ColorImage @1 dark)   -- ...

triangleRasterCtx = TriangleCtx CullNone PolygonFill NoOffset LastVertex
colorFragmentCtx = AccumulationContext (DepthOp Less True, ColorOp NoBlending (V4B True True True True))

rasterizeWith = Rasterize
triangles = triangleRasterCtx

cubeVertexStream = Fetch "stream4" Triangles (IV4F "position4")
mapFragments s fs = Accumulate colorFragmentCtx PassAll (\a -> FragmentOutRastDepth $ fs a) s clear
transform s f =  Transform (\v -> VertexOut (f v) 1 () (Smooth v)) s

scale t v = v * V4 t t t 1

rotate' v = (Uni $ IM44F "MVP") *. v
const x y = x
x & f = f x



main =             cubeVertexStream         -- cube vertices
    `transform`    (scale 0.5 . rotate')    -- scale them
     &             rasterizeWith triangles  -- rasterize
    `mapFragments` id
     &             ScreenOut                -- draw into screen
"""
