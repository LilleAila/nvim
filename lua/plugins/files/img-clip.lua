return {
	{
		"HakonHarnes/img-clip.nvim",
		event = "BufEnter",
		opts = {
			default = {
				drag_and_drop = {
					enabled = true,
					insert_mode = true,
					download_images = true,
				},
				prompt_for_file_name = true,
				use_cursor_in_template = true,
				insert_mode_after_paste = true,
				embed_image_as_base64 = false,
			},

			tex = {
				template = [[
				\begin{figure}[h]
					\centering
					\includegraphics[width=0.8\textwidth]{$FILE_PATH}
					\caption{$CURSOR}
					\label{fig:$LABEL}
				\end{figure}
				]],
				use_absolute_path = false,
				relative_to_current_file = true,
			},
		},
	}
}
