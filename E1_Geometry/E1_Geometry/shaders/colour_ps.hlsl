// Colour pixel/fragment shader
// Basic fragment shader outputting a colour

struct InputType
{
	float4 position : SV_POSITION;
	float4 colour : COLOR;

};


float4 main(InputType input) : SV_TARGET
{

	input.colour = float4(1.0f, 0.0f, 0.0f, 0.0f);
return input.colour;
}