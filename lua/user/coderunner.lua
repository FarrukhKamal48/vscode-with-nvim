require("code_runner").setup({
	mode = "toggleterm",
    focus = false,
	startinsert = false,
	term = {
		position = "vert",
		size = 15,
	},
	filetype = {
		-- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "clear && python3.10 -u",
		c = "gcc $file -o $fileNameWithoutExt && clear && $dir/./$fileNameWithoutExt",
		-- typescript = "deno run",
		-- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},
	-- project = {
	-- 	["~/deno/example"] = {
	-- 		name = "ExapleDeno",
	-- 		description = "Project with deno using other command",
	-- 		file_name = "http/main.ts",
	-- 		command = "deno run --allow-net",
	-- 	},
	-- 	["~/cpp/example"] = {
	-- 		name = "ExapleCpp",
	-- 		description = "Project with make file",
	-- 		command = "make buid & cd buid/ & ./compiled_file",
	-- 	},
	-- },
})
