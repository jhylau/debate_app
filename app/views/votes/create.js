page.replace_html :votes, @debate_side.votes.count
page[:vote_form].reset
