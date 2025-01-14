project "imgui"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"*.h",
		"*.cpp"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++14"
		staticruntime "On"

	filter {"system:windows" ,"configurations:Release"}
		buildoptions "/MT"

