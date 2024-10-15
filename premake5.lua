project "shaderc"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"glslc/src/file_compiler.cc",
		"glslc/src/file_compiler.h",
		"glslc/src/file.cc",
		"glslc/src/file.h",
		"glslc/src/file_includer.cc",
		"glslc/src/file_includer.h",
		"glslc/src/resource_parse.h",
		"glslc/src/resource_parse.cc",
		"glslc/src/shader_stage.cc",
		"glslc/src/shader_stage.h",
		"glslc/src/dependency_info.cc",
		"glslc/src/dependency_info.h",
	}

	includedirs
	{
		"%{IncludeDir.shaderc}",
		"%{IncludeDir.shaderc}/libshaderc/include",
		"%{IncludeDir.shaderc}/libshaderc_util/include",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
