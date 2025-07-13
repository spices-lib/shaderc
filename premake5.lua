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

		"libshaderc_util/src/args.cc",
		"libshaderc_util/src/compiler.cc",
		"libshaderc_util/src/file_finder.cc",
		"libshaderc_util/src/io_shaderc.cc",
		"libshaderc_util/src/message.cc",
		"libshaderc_util/src/resources.cc",
		"libshaderc_util/src/shader_stage.cc",
		"libshaderc_util/src/spirv_tools_wrapper.cc",
		"libshaderc_util/src/version_profile.cc",
	}

	includedirs
	{
		"%{IncludeDir.VulkanSDK}",
		"%{IncludeDir.glslang}", 
		"%{IncludeDir.shaderc}",
		"%{IncludeDir.shaderc}/libshaderc/include",
		"%{IncludeDir.shaderc}/libshaderc_util/include",
	}

	defines
	{
		"ENABLE_HLSL"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
