

target("Lua")
	set_kind("shared")
	

	set_languages("c11", "cxx14")
	
	add_files("../*.c")
	del_files("../lua.c")
	del_files("../onelua.c")


	add_headerfiles("../*.h")

	if (is_os("windows")) then
		add_defines("LUA_BUILD_AS_DLL=1")
	end
	
	
	if (is_os("android")) then
		add_defines("lua_getlocaledecpoint()=46")		
		add_defines("ANDROID_STL=gnustl_shared")
	end

	if (is_os("ios")) then
		set_kind("static")
	end

target("LuaMain")
	set_kind("binary")
	
	add_files("../lua.c")

	add_headerfiles("../*.h")
	
	add_linkdirs("build/windows/x64/release")
	add_links("Lua")
	
	set_languages("c11", "cxx14")
	
	add_defines("LUA_BUILD_AS_DLL=1")

	if (is_os("windows")) == false then
		set_enabled(false)
	end

