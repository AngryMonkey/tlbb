--�رճ�ɱ

--�ű��� ���ĳ���ȷ�ű��ţ�



x800114_g_scriptId = 800114





function x800114_OnDefaultEvent( sceneId, selfId, targetId )
	ret = LuaFnCloseRevenge(sceneId, selfId);
	if ret then
		if ret == 1 then
		end
	end

end



function x800114_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId,x800114_g_scriptId,"�ҷ�����",10,x800114_g_scriptId)

end

