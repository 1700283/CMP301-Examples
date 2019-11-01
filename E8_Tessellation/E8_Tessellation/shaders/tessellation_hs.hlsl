// Tessellation Hull Shader
// Prepares control points for tessellation
cbuffer TessFactors : register(b0)
{
	int edge_1;
	int edge_2;
	int edge_3;
	int edge_4;
	int inside;
	int inside_2;
	int padding[2];
};

struct InputType
{
    float3 position : POSITION;
    float4 colour : COLOR;
};

struct ConstantOutputType
{
    float edges[4] : SV_TessFactor;
    float inside[2] : SV_InsideTessFactor;
};

struct OutputType
{
    float3 position : POSITION;
    float4 colour : COLOR;
};

ConstantOutputType PatchConstantFunction(InputPatch<InputType, 4> inputPatch, uint patchId : SV_PrimitiveID)
{    
    ConstantOutputType output;

    // Set the tessellation factors for the three edges of the triangle.
	output.edges[0] = edge_1;
	output.edges[1] = edge_2;
	output.edges[2] = edge_3;
	output.edges[3] = edge_4;

    // Set the tessellation factor for tessallating inside the triangle.
	output.inside[0] = inside;
	output.inside[1] = inside_2;
    return output;
}

/*
[domain("tri")]
[partitioning("integer")]
[outputtopology("triangle_ccw")]
[outputcontrolpoints(3)]
[patchconstantfunc("PatchConstantFunction")]
*/

[domain("quad")]
[partitioning("integer")]
[outputtopology("triangle_ccw")]
[outputcontrolpoints(4)]
[patchconstantfunc("PatchConstantFunction")]
OutputType main(InputPatch<InputType, 4> patch, uint pointId : SV_OutputControlPointID, uint patchId : SV_PrimitiveID)
{
    OutputType output;


    // Set the position for this control point as the output position.
    output.position = patch[pointId].position;

    // Set the input colour as the output colour.
    output.colour = patch[pointId].colour;

    return output;
}