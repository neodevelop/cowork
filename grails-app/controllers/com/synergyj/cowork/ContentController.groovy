package com.synergyj.cowork

class ContentController {
  def index = { }
  def home = {}
  def content = {
    def key = params.id
    render view:key
  }
}
