x777777_g_scriptId=777777
x777777_g_open=1	--1打开调试 --0关闭调试

--[2007/09/14 YangJun]
--请勿修改本脚本内容
--仅调试使用，切勿修改！！！！！

function x777777_DebugBegin(sceneId)
	if x777777_g_open > 0 then
		setcallhook(x777777_CallHook)
	end
end

function x777777_DebugEnd(sceneId)
	if x777777_g_open > 0 then
		setcallhook()
	end
end

function x777777_CallHook(event)
  local cd = date("T0=%Y-%m-%d_%X T1=")..tostring(clock())
  local of = appendto("./Log/luadebug_"..date("%Y-%m-%d")..".log")
  
  if x777777_g_open > 0 then
		local info = getinfo(2);
		if info then
		  local logstr = tostring(event).." "..tostring(info.name).."("..tostring(info.what)..") "
			--print(logstr)
			if of then write(of,logstr.." "..cd.."\n") end
			if "call" == event then
				local n = 1
				info=getinfo(3)
				if info then
					local name,val = getlocal(3,n)
					while name do
					  logstr = " "..tostring(name).."="..tostring(val)
						--print(logstr)
						if of then write(of,logstr.."\n") end
						n=n+1
						name,val=getlocal(3,n)
					end
				else
					if of then write(of,"level 3 error! exit hook "..cd.."\n") end
					setcallhook()
				end
			end
		else
		  if of then write(of,"level 2 error! exit hook "..cd.."\n") end
		  setcallhook()
		end
	else
		if of then write(of,"x777777_g_open=0! exit hook "..cd.."\n") end
		setcallhook()
	end
	
	if of then closefile(of) end
end
