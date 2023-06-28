module("luci.controller.auth", package.seeall)

local template = require "luci.template"
local uci = require "luci.model.uci".cursor()
local takfi = require "luci.takfi"
local jsonc = require "luci.jsonc"
local util = require "luci.util"
local storage = 0


function index()


	entry({"wifidog"}, call("wd_ping"))	
	entry({"wifidog","ping"}, call("wd_ping"))
	entry({"wifidog","auth"}, call("wd_auth"))

	entry({"platforms"})
	entry({"platforms","auth"}, call("wd_login"))

	entry({"protal"})
	entry({"protal","callback"}, call("wd_protal_callback"))
end



function wd_login()
	
end

function wd_ping()
	luci.http.write("Pong")
end

function wd_auth()
	local request_method = luci.http.getenv("REQUEST_METHOD")
	
	if request_method == "POST" then
		
		resp = {}
		auth_op = {}
		resp.auth_op = auth_op

		local json_data = luci.http.formvalue()
		local clients = jsonc.parse(json_data)
		
		if clients then
			
		end

		luci.http.prepare_content("application/json")
		luci.http.write(jsonc.stringify(resp))
		
		
	elseif request_method == "GET" then
		
	end	
end

function wd_protal_callback()
	
end

