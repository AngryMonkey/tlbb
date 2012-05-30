--ͬ������
--����һЩ���ɹ�����ֱ�����һ��ʦ������....

x229011_g_scriptId = 229011



--**********************************
--������ں���
--**********************************
function x229011_OnDefaultEvent( sceneId, selfId, targetId, menpaiId, numTextId )

	if numTextId == 1 then

		BeginEvent( sceneId )

			if IsHaveMission(sceneId,selfId,MENPAI_SHIMEN_MISID[menpaiId+1]) <= 0 then
				AddText( sceneId, "�����û�н���ʦ�����񰡡�")
			else
				local strText = "  ��ҫʦ�ţ���������ÿ��������ʦ������ĵ������ǻ������Ľ����ģ���Ȼ������ʦ�������������ѵĵ�������Ҳ������Э���ġ�#r  ��ȷ��Ҫ����#G%d��#Wʦ�Ź��׶ȣ�������ͬ��ʦ�ֺ�ʦ�������ɵ�ǰʦ��������"
				strText = format( strText, x229011_GetHelpFinishNeed( sceneId, selfId ) )
				AddText( sceneId, strText )
				AddNumText( sceneId, x229011_g_scriptId, "ȷ��", 6, 2 )
				AddNumText( sceneId, x229011_g_scriptId, "�뿪", 8, 3 )
			end

		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif numTextId == 2 then

		CallScriptFunction( MENPAI_SHIMEN_SCRIPTID[menpaiId+1], "HelpFinishOneHuan", sceneId, selfId, targetId )

	elseif numTextId == 3 then

		--�رնԻ�����....
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		
	end

end

--**********************************
--�о��¼�
--**********************************
function x229011_OnEnumerate( sceneId, selfId, targetId, menpaiId )

	--�����Ҳ��Ǹñ����ɵľͲ���ʾ....
	if menpaiId == GetMenPai( sceneId, selfId ) then
		AddNumText( sceneId, x229011_g_scriptId, "ͬ������", 6, 1 );
	end

end

--**********************************
--����ͬ��������������ɹ���....
--**********************************
function x229011_GetHelpFinishNeed( sceneId, selfId )

	--ͬ���������蹱�׶�=���20���Ĺ��׶� * 80%
	
	--ÿ��ʵ�ʽ������׶�=����ҵȼ�-�����ȼ���* �ȼ�Ӱ����� + �������׶�
	--���20���Ĺ��׶�=����ҵȼ�-�����ȼ���* �ȼ�Ӱ����� * 20 + 20���������׶��ܺ�(=40)
	
	local level = GetLevel(sceneId, selfId)
	local need = (level - 10) * 0.05 * 20 + 40
	need = need * 0.8
	need = floor( need )

	return need

end

--**********************************
--��Ⲣ�۳�ͬ��������������ɹ���....
--**********************************
function x229011_CheckAndDepleteHelpFinishMenPaiPoint( sceneId, selfId, targetId )

	local needPoint = x229011_GetHelpFinishNeed( sceneId, selfId )
	local menpaiPoint = GetHumanMenpaiPoint( sceneId, selfId )

	if menpaiPoint < needPoint then
		BeginEvent(sceneId)
			AddText( sceneId, "  �����û���㹻��ʦ�Ź��׶ȣ���Ϊʦ����Щ���ף���������ͬ��Ҳ��ȫ��������ġ�" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return 0
	else
		SetHumanMenpaiPoint( sceneId, selfId, menpaiPoint-needPoint )
		return 1
	end

end
