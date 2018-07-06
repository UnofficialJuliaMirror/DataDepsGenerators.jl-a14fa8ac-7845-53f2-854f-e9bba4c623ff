
"""
    lift(func, arg)
Calls `func(arg)`, propagating `missing` values
"""
lift(func, ::Missing)=missing
lift(func, arg) = func(arg)


quiet_download(url) = @suppress(download(url))

"""
    getpage(url)

downloads and parses the page from the URL
"""
getpage(url) = parsehtml(String(read(quiet_download(url))))

"""
    text_only(doc)

Extracts just the unformatted text (no attributes etc),
from a HTML document or fragment(/s)
"""
text_only(doc::HTMLDocument) = text_only(doc.root)
text_only(frag) = join([replace(text(leaf), "\r","") for leaf in Leaves(frag) if leaf isa HTMLText], " ")
text_only(frags::Vector) = join(text_only.(frags), " ")

filter_html(::Missing) = missing

function filter_html(content)
    #Check if the incoming content is a HTML or not
    if ismatch(r"<(\"[^\"]*\"|'[^']*'|[^'\">])*>", content)
        return text_only(parsehtml(content))
    end
    return content
end

"
    indent(str)

Indents each line in a string
"
indent(str, indentwith="\t") = join(indentwith.*strip.(split(str, "\n")), "\n")


"""
    escape_multiline_string

like Escape string, but does not escape newlines
"""
function escape_multiline_string(s::AbstractString)
    escaped = s
    escaped = replace(escaped, '\$', raw"\$")
    escaped = replace(escaped, '\\', raw"\\")
    escaped
end
