package com.synergyj.cowork.event

/**
 * Created by IntelliJ IDEA.
 * User: neodevelop
 * Date: 07/02/11
 * Time: 18:42
 * To change this template use File | Settings | File Templates.
 */
class EventInfo {
  Long id
  String title
  Boolean allDay = false
  Date start
  Date end
  String url
  String className
  Boolean editable = false
}
