-- �콱NPC
--���ľͺ�����

x899994_g_scriptId = 899994
x899994_g_duihuan_scriptId = 77
--�����߼��ű���....
x899994_g_FuBenScriptId = 002939

--**********************************
--�¼��������
--**********************************
function x899994_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "���¸������������С���������" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
	
		   		AddText( sceneId, "    �ҵ��常���������������ӵ�,���и��о��������ر������������黭�����������ľ�ׯȴ�ø����ն��ֶν��ر����ߣ������˼����š�����" )	
	   			AddText( sceneId, "����������µ������ѣ���ȴ���˫�Ȳм������,���常������������,�ұ��뽫�ر����������Ը�������������ģ��ڴ˿�����λ�������Ҷ���ر�,��СŮ���ܹ�����Т�ġ�" )
		   		--AddNumText( sceneId, x899994_g_ScriptId, "#e6f00c7�һ�[���µ�һ����]", 4, 10 )
		   		--AddNumText( sceneId, x899994_g_ScriptId, "#cf30768ɨ��ɮ����:[����������]��ȡ", 4, 20 )
		   		AddNumText( sceneId, x899994_g_ScriptId, "��ս�ľ�ׯ", 10, 1 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x899994_OnEventRequest( sceneId, selfId, targetId, eventId )


	--����Ƿ���Խ��븱��....
--	local ret, msg = x899994_CheckCanEnter( sceneId, selfId, targetId )
--	if 1 ~= ret then
--		BeginEvent(sceneId)
--			AddText(sceneId,msg)
--		EndEvent(sceneId)
--		DispatchEventList(sceneId,selfId,targetId)
--		return
--	end

	--�ر�NPC�Ի�����....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
	CallScriptFunction(002939 , "OnDefaultEvent", sceneId, selfId)--����
--	x899994_MakeCopyScene( sceneId, selfId )

end
	--if eventId == x805016_g_duihuan_scriptId then
		--CallScriptFunction( x805016_g_duihuan_scriptId, "OnEventRequest",sceneId, selfId, targetId, GetNumText() )	
		--return
	--end

