import re

line = "..  _first_steps:getting_source:first:"

m_obj = re.search(r"\.\.\s+_([\w:]+):", line)

if m_obj:
  # label found
  key = m_obj.group(1)
  print key
  
raw_title = 'Breaking symmetry with ``SymmetryBreaker``\s and ``SymmetryBreaker``\s'

raw_title = 'titi'

def transform_html_title(raw_title):
  """Transforms rst title into sphinx html title.
  """
  index = 0
  index2 = 0
  escaped_title = raw_title.replace('\s', 's')
  escaped_title_len = len(escaped_title)
  title = ''
  begin_code = '<tt class="docutils literal"><span class="pre">'
  end_code = '</span></tt>'
  
  while (index < escaped_title_len):
    index = escaped_title.find("``", index)
    if not index == -1:
      title += escaped_title[index2:index]
      index += 2
      index2 = escaped_title.find("``", index)
      if index2 == -1:
        print "Title '" + escaped_title + "'contains beginning '``' but not ending '``'!"
        return escaped_title
      else:
        stub = escaped_title[index:index2]
        title += begin_code + stub + end_code
        index2 += 2
        index = index2
        print "STUB: " + stub
    else:
      title += escaped_title[index2:]
      break
  return title
  
print transform_html_title(raw_title)
