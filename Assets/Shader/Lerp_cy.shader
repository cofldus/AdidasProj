Shader "Custom/Lerp_cy"
{
    Properties
    {
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _MainTex2("Albedo (RGB)", 2D) = "white" {}
    }
        SubShader
        {
            Tags { "RenderType" = "Opaque" }

            CGPROGRAM
            // Physically based Standard lighting model, and enable shadows on all light types
            #pragma surface surf Standard fullforwardshadows

            sampler2D _MainTex;
            sampler2D _MainTex2;

            struct Input
            {
                float2 uv_MainTex;
                float2 uv_MainTex2;
            };

            void surf(Input IN, inout SurfaceOutputStandard o)
            {
                // Albedo comes from a texture tinted by color
                fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
                fixed4 d = tex2D(_MainTex2, IN.uv_MainTex2);
                o.Albedo = lerp(c.rgb, d.rgb, 0.5);
                o.Alpha = c.a;
            }
            ENDCG
        }
            FallBack "Diffuse"
}
