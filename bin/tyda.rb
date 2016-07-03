#!/usr/bin/env ruby -w

require 'optparse'
require 'json'
require 'erb'
require 'ostruct'

options = {}
op = OptionParser.new do |opts|
  opts.banner = "usage: tyda.rb [--simple] [--languages LANGUAGES] QUERY"

  opts.on('-s', '--simple', 'Simple output') { |v| options[:simple] = true }
  opts.on('-l', '--languages LANGUAGES', Array, 'Languages to translate to (en fr de es la nb sv) [default: [en]]') { |v| options[:languages] = v }
  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end
op.parse!

unless ARGV[0]
	puts op.banner
	puts 'error: query is required'
	exit 1
end

advanced = %{Search term: <%= search_term %>
Language: <%= language %>
Word class: <%= word_class %>
Conjugations: <%= conjugations.join(', ') %>
Translations
<% for t in translations %><%= t["language"] %><% if t["description"] != '' %> - <%= t["description"] %><% end %><% for w in t["words"] %>
  <%= w["value"] %><% if w["context"] != '' %> - <%= w["context"] %> <% end %><% if w["pronunciation_url"] != '' %>
    Pronunciation: <%= w["pronunciation_url"] %><% end %><% if w["dictionary_url"] != '' %>
    Dictionary: <%= w["dictionary_url"] %><% end %><% end %><% end %><%if synonyms %>
Synonyms
<% for s in synonyms %>  <%= s["value"] %><% if s["context"] != '' %> - <%= s["context"] %> <% end %>
<% end %><% end %>
}

simple = %{<% for t in translations %><% for w in t["words"] %><%= w["value"] %> <% end %><% end %>
Synonyms: <%for s in synonyms %><%= s["value"]%> <% end %>
}

command = 'tyda-api'
command += ' -l ' + options[:languages].join(' ') if options[:languages]
command += ' -- ' + ARGV[0]

output = `#{command}`
result = JSON.parse(output)
response = OpenStruct.new(result)

if options[:simple]
  tmpl = ERB.new(simple)
  puts tmpl.result(response.instance_eval { binding })
else
  tmpl = ERB.new(advanced)
  puts tmpl.result(response.instance_eval { binding })
end
