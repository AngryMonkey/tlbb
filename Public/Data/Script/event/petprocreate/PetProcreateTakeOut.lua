--���޷�ֳ(ȡ����)
--�ű��� ���ĳ���ȷ�ű��ţ�

x800102_g_scriptId = 800102

function x800102_OnDefaultEvent( sceneId, selfId, targetId )

	--��ȡ��ҵ�ǰ�����޷�ֳ��Ϣ
	local checkRet	= LuaFnCheckPetProcreateTakeOut( sceneId, selfId )
	if checkRet == 1 then
		LuaFnPetProcreateTakeOut( sceneId, selfId )
	end

end

function x800102_OnEnumerate( sceneId, selfId, targetId )

	--��1����ֳ�����У���ʾ��ֳ����
	--		�������AAA��BBB������CCC���ڿ��ֵ���Ϸ���ٹ�D���ӣ����ܴ��Ŷ������޻ص�����ߡ�
	--��2����ֳ�ɹ�����ȡ������
	AddNumText( sceneId, x800102_g_scriptId, "ȡ����ɷ�ֳ������", 6, x800102_g_scriptId )

end

--ȡ����ֳ���ޡ�Lybin Oct.24 2006��
--�˺�������Server���յ�WGPetProcreateQuestTakeOutResult��Ϣ���󣬱���ִ��
--���������޸�
--function x800102_OnTakeOut( sceneId, selfId )
--
--	local	checkRet	= LuaFnCheckPetProcreateTakeOut( sceneId, selfId )
--	if checkRet == 1 then
--		LuaFnPetProcreateTakeOut( sceneId, selfId )
--	end
--end
