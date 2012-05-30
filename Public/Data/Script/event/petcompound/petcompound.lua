--珍兽繁殖
--脚本号 （改成正确脚本号）

x800103_g_scriptId = 800103


function x800103_OnDefaultEvent( sceneId, selfId, targetId )
	LuaFnCallPetCompoundUI(sceneId, selfId, targetId, 150);
end

function x800103_OnEnumerate( sceneId, selfId, targetId )
--AddNumText(sceneId,x800103_g_scriptId,"炼兽",6,x800103_g_scriptId)
end
