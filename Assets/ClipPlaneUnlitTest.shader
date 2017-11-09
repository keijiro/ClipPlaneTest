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

            struct Varyings
            {
                float4 position : SV_POSITION;
                float2 texcoord : TEXCOORD;
                float clip0 : SV_ClipDistance0;
                float clip1 : SV_ClipDistance1;
            };

            Varyings Vertex(Attributes input)
            {
                Varyings o;
                o.position = UnityObjectToClipPos(input.position);
                o.texcoord = input.texcoord;
                o.clip0 = input.texcoord.x * 2 - 1;
                o.clip1 = 1.7 - dot(input.texcoord, 1);
                return o;
            }

            half4 Fragment(Varyings input) : SV_Target
            {
                return half4(input.texcoord.xy, 0, 1);
            }

            ENDCG
        }
    }
}
