Shader "ClipPlaneUnlitTest"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM

            #pragma vertex Vertex
            #pragma fragment Fragment

            #include "UnityCG.cginc"

            struct Attributes
            {
                float4 position : POSITION;
                float2 texcoord : TEXCOORD;
            };

            void Vertex(
                Attributes input,
                out float4 position : SV_POSITION,
                out float2 texcoord : TEXCOORD,
                out float clip0 : SV_ClipDistance0,
                out float clip1 : SV_ClipDistance1
            )
            {
                position = UnityObjectToClipPos(input.position);
                texcoord = input.texcoord;
                clip0 = input.texcoord.x * 2 - 1;
                clip1 = 1.7 - dot(input.texcoord, 1);
            }

            half4 Fragment(float2 texcoord : TEXCOORD) : SV_Target
            {
                return half4(texcoord.xy, 0, 1);
            }

            ENDCG
        }
    }
}
