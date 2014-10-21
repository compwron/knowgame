class CommonFiles
	def initialize(since_date, file_count)
		files = `git log --pretty=format: --name-only --after #{since_date} | sort | uniq -c | sort -rg | head -#{file_count}`
		p files
	end
end