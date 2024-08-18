local M = {}

function M.HandleSpellingErrors()
	-- Keep track of visited positions and processed words to avoid duplicates
	local visited_positions = {}
	local processed_words = {}
	local initial_position = vim.fn.getcurpos()

	-- Move to the first spelling error
	vim.cmd("silent normal! [s")

	-- Loop through all spelling errors
	while true do
		local current_position = vim.fn.getcurpos()

		-- Check if we have visited this position before
		local key = current_position[2] .. ":" .. current_position[3] -- line:column
		if visited_positions[key] then
			vim.cmd("silent normal! ]s") -- Move to the next error
			current_position = vim.fn.getcurpos()
			-- Break if we return to the starting position or no more errors
			if current_position[2] == initial_position[2] and current_position[3] == initial_position[3] then
				break
			end
		else
			-- Mark this position as visited
			visited_positions[key] = true

			local word = vim.fn.expand("<cword>")

			-- Skip the word if it has already been processed
			if not processed_words[word] then
				-- Ask the user if they want to add the word to dictionary
				local choice = vim.fn.input(string.format("Add '%s' to dictionary? (y = yes, n = no): ", word))

				if choice == "y" then
					vim.cmd("normal! zg")
					processed_words[word] = true
				elseif choice == "s" then
					-- Just skip to the next error without doing anything
					processed_words[word] = true
				else
					-- Exit loop if any other key is pressed
					break
				end
			end
		end

		-- Move to the next spelling error
		vim.cmd("silent normal! ]s")
		local next_position = vim.fn.getcurpos()

		-- If the next position is the same as the current one, it means there are no more errors
		if next_position[2] == current_position[2] and next_position[3] == current_position[3] then
			break
		end
	end
end

return M
