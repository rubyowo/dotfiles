return {
  current_line_blame = true,
  current_line_blame_formatter = function(name, blame_info, opts)
    if blame_info.author == name then
      blame_info.author = 'You'
    end
    local text
    if blame_info.author == 'Not Committed Yet' then
      text = blame_info.author
    else
      local date_time
      if opts.relative_time then
        date_time = require('gitsigns.util').get_relative_time(tonumber(blame_info['author_time']))
      else
        date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
      end
      text = string.format('%s, %s (%s)', blame_info.author, date_time, blame_info.summary)
    end
    return { { ' ' .. text, 'GitSignsCurrentLineBlame' } }
  end,
  current_line_blame_formatter_nc = 'You (Uncommitted changes)',
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
}
