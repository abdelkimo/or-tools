# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# ortools Sphinx extension module.
# See documentation manual.
from sphinx.roles import XRefRole
from sphinx.util.osutil import relative_uri
from docutils import nodes, utils
from pprint import pprint

import os

from references import fetch_all_internal_labels

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
    else:
      title += escaped_title[index2:]
      break
  return title

class ortools_ref_node(nodes.Inline, nodes.Element, nodes.Referential):
    def __init__(self):
        super(ortools_ref_node, self).__init__()
        self.attributes['ortools_title'] = None
        self.attributes['ortools_html_target'] = None
        self.attributes['ortools_latex_target'] = None
        self.attributes['ortools_type'] = None
        self.attributes['capital'] = None

    def get_right_prefix(has_prefix, has_capital, typ):
        labels_type = {
          'chap' : 'chapter',
          'sec'  : 'section',
          'fig'  : 'Figure',# always with capital letter
          'tab'  : 'table',
          'top'  : 'topic'
        }
        prefix = ''
        if has_prefix:
          prefix += 'the '
        prefix += labels_type[typ]
        if has_capital:
          prefix = prefix[0].upper() + prefix[1:]
        return prefix 

    get_right_prefix = staticmethod(get_right_prefix)


def visit_ortools_ref_html(self, node):
  target = node.attributes['ortools_html_target']
  title = transform_html_title(node.attributes['ortools_title'])

  #prefix = ortools_ref_node.get_right_prefix(True, node['capital'], node['type'])
  prefix = 'ttii'
  self.body.append(u'%s' % prefix + ' <a class="reference internal" href="%s" '
                             %  target +
                             u'><em>%s' % title + 
                             u'</em></a>')
  
  raise nodes.SkipNode
  

def visit_ortools_ref_latex(self, node):
  raise nodes.SkipNode


def ortools_role(role, rawtext, text, lineno, inliner, options={}, content=[]):
  env = inliner.document.settings.env
  labels = env.app.config.labels
  newnode = ortools_ref_node()
 
  return [newnode], []


class ortools_ref_role(XRefRole):
    def __init__(self):
        XRefRole.__init__(self, fix_parens=False, lowercase=False)
        #self.domain = 

    def result_nodes(self, document, env, node, is_ref):
        if not is_ref:
            return [node], []
        domain = env.domains['std']
        labels = env.app.config.labels
        newnode = ortools_ref_node()
        target = node['reftarget']
        # test if we use a capital or not
        if target.startswith('^'):
          newnode['capital'] = True
          target = target[1:]
        else:
          newnode['capital'] = False
       
        newnode['reftype'] = node['reftype']
        newnode['refdoc'] = node['refdoc']
        newnode['reftarget'] = target
        if labels.has_key(target):
          if node['refexplicit']:
            title = node.astext()
            if title.startswith('^'):
              newnode['capital'] = True
              title = title[1:]
          else:
            title = labels[target]['title']
          newnode.attributes['ortools_title'] = title
          #newnode.attributes['type'] = labels[target]['type']
          reftarget = os.path.join(labels[target]['rel_path'], labels[target]['filename'][:-4])
          labelid = nodes.make_id(target)
          html_reluri = relative_uri(node['refdoc'], reftarget) + '.html#' + str(labelid)
          newnode.attributes['ortools_html_target'] = html_reluri
        else:
          print "Target '" + target + "' is not defined!"
          return [node], []

        #newnode.attributes['ortools_html_target'] = html_reluri
        return [newnode], []

############################################################################
############################################################################
def get_labels(app):
  """Fetches all labels in the corresponding dir and files.
     TODO: use cache.
  """
  basedirname = app.config.ortools_basedirname
  fetch_all_internal_labels(basedirname, app.config.ortools_ext, app.config.labels)


def setup(app):
    app.add_node(ortools_ref_node, html=(visit_ortools_ref_html, None),
                              latex=(visit_ortools_ref_latex, None))
###########################################################################
    app.add_config_value('ortools_basedirname', 
                         './manual', 
                         'env')
    app.add_config_value('ortools_ext', 
                         'rst', 
                         'env')
    app.add_config_value('ortools_chap_char', 
                         '=', 
                         'env')
    app.add_config_value('labels', {}, True)
    app.add_role('yref', ortools_role) 
    app.connect("builder-inited", get_labels)
