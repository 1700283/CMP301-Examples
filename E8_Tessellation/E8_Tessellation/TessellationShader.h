// Light shader.h
// Basic single light shader setup
#pragma once

#include "DXF.h"

using namespace std;
using namespace DirectX;


class TessellationShader : public BaseShader
{
private: 
	struct tessBufferType
	{
		int edge_1;
		int edge_2;
		int edge_3;
		int edge_4;
		int inside;
		int inside_2;
		int padding[2];
	};
public:

	TessellationShader(ID3D11Device* device, HWND hwnd);
	~TessellationShader();

	void setShaderParameters(ID3D11DeviceContext* deviceContext, const XMMATRIX &world, const XMMATRIX &view, const XMMATRIX &projection);
	int edge_1_, edge_2_, edge_3_, edge_4_, inside_, inside_2_;
	float distance_;

private:
	void initShader(const wchar_t* vsFilename, const wchar_t* psFilename);
	void initShader(const wchar_t* vsFilename, const wchar_t* hsFilename, const wchar_t* dsFilename, const wchar_t* psFilename);

private:
	ID3D11Buffer* matrixBuffer;
	ID3D11Buffer* tessBuffer;
};
