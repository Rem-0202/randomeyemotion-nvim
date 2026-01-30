return {
	"frabjous/knap",
    checker = {enabled = "false"},
	config = function()
		local gknapsettings = {
			textopdf = 'pdflatex -jobname "$(basename -s .pdf %outputfile%)" -halt-on-error',
			textopdfbufferasstdin = true,
			verbose = false,
		}
		vim.g.knap_settings = gknapsettings
	end,
}
