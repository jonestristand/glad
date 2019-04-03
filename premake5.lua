project "glad"
  kind "StaticLib"
  language "C"
    
  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  files {
    "include/glad/glad.h",
    "include/KHR/khrplatform.h",
    "src/glad.c"
  }

  includedirs "include"

  filter "system:linux"
    pic "On"
    systemversion "latest"
    staticruntime "On"

  filter "system:windows"
    systemversion "latest"
    staticruntime "On"
        
filter "configurations:Debug"
  defines "ULLR_DEBUG"
  runtime "Debug"
  symbols "on"

filter "configurations:Release"
  defines "ULLR_RELEASE"
  runtime "Release"
  optimize "on"

filter "configurations:Dist"
  defines "ULLR_DIST"
  runtime "Release"
  optimize "on"