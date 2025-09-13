require('nvim-web-devicons').setup {
	color_icons = true;
	default = true;
	strict = true;
	variant = "dark";
	override_by_filename = {
		["readme"] = {
			icon = "",
			color = "#EDEDED",
			name = "Readme"
		},
		["README.md"] = {
			icon = "",
			color = "#EDEDED",
			name = "Readme"
		}
	};
}

