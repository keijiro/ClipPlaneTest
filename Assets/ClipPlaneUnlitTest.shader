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
                float2 texcoord : TEXCOORD0;
            };

            struct Varyings
            {
                float4 position : SV_POSITION;
                float clip0 : SV_ClipDistance0;
                float clip1 : SV_ClipDistance1;
            };

            Varyings Vertex(Attributes input)
            {
                Varyings o;
                o.position = UnityObjectToClipPos(input.position);
                o.clip0 = input.texcoord.x * 2 - 1;
                o.clip1 = 1.7 - dot(input.texcoord, 1);
                return o;
            }

            half4 Fragment(Varyings input) : SV_Target
            {
                return half4(input.clip0, input.clip1, 0, 1);
            }

            ENDCG
        }
    }
}
