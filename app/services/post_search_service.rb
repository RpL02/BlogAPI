class PostSearchService
	def self.search(posts, query)
		# posts.where("title like '%#{query}%'")
		post_ids = Rails.cache.fetch("post_search/#{query}", expires_in: 1.hours) do
			posts.where("title like '%#{query}%'").map(&:id)
		end

		posts.where(id: post_ids)
	end
end