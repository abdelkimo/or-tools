from sphinx.roles import XRefRole
from docutils import nodes, utils
from pprint import pprint


class ortools_ref(nodes.Element):
  pass 

def visit_ortools_ref_html(self, node):
  return 
  
def depart_ortools_ref_html(self, node):
  return 
  

class YXRefRole(XRefRole):
    def __init__(self):
        XRefRole.__init__(self, fix_parens=False, lowercase=False, 
                          nodeclass=ortools_ref)

    def process_link(self, env, refnode, has_explicit_title, title, target):
        refnode['reftype'] = 'ref'
        refnode['refexplicit'] = True  # to prevent that Sphinx overwrites
                                       # the title you set
        print env 
        print refnode
        print has_explicit_title
        print title 
        print target
        
        #return '[['+title+']]','prefix.'+target
        return '[['+title+']]', target
    
    def result_nodes(self, document, env, node, is_ref):
        return [node], []

def ortools_reference_role(role, rawtext, text, lineno, inliner,
                       options={}, content=[]):
    ref = inliner.rfc_url
    #set_classes(options)
    node = nodes.reference(rawtext, utils.unescape(text), refuri=ref,
                           **options)
    node = ortools_ref()
    return [node], []
    
def rfc_reference_role(role, rawtext, text, lineno, inliner,
                       options={}, content=[]):
    try:
        rfcnum = int(text)
        if rfcnum <= 0:
            raise ValueError
    except ValueError:
        msg = inliner.reporter.error(
            'RFC number must be a number greater than or equal to 1; '
            '"%s" is invalid.' % text, line=lineno)
        prb = inliner.problematic(rawtext, rawtext, msg)
        return [prb], [msg]
    # Base URL mainly used by inliner.rfc_reference, so this is correct:
    ref = inliner.document.settings.rfc_base_url + inliner.rfc_url % rfcnum
    #set_classes(options)
    node = nodes.reference(rawtext, 'RFC ' + utils.unescape(text), refuri=ref,
                           **options)
    return [node], []

#register_canonical_role('rfc-reference', rfc_reference_role)


def setup(app):
    app.add_role_to_domain('std', 'yref', YXRefRole()) 
    app.add_role('rfc-reference', rfc_reference_role)
    app.add_role('ortools_ref', ortools_reference_role)
    app.add_node(ortools_ref, html=(visit_ortools_ref_html, depart_ortools_ref_html))

