class CommonFiles
	attr_reader :files
	def initialize(root, since_date, file_count)
		@files = `git --git-dir=#{root}/.git --work-tree=#{root} log --pretty=format: --name-only --after #{since_date} | sort | uniq -c | sort -rg | head -#{file_count}`
		p files
	end
end