//
//  Constant.swift
//  常量类
//
//  Created by pc on 2022/5/4.
//

import Foundation
import UIKit
import SwiftyJSON
import SQLite
//账号密码
var username = "123"
var password = "456"
//json数据
var json: JSON!
//数据库
var db:Connection!
//表
var collectdata = Table("collectdata")
//表格元素
let id = Expression<Int64>("id")
let titles = Expression<String?>("titles")
let url = Expression<String?>("url")
let source = Expression<String?>("source")
let ptime = Expression<String?>("ptime")
let imgsrc = Expression<String?>("imgsrc")
