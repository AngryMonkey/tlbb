x889068_g_ScriptId = 889068

--**********************************
--�о��¼�
--**********************************
function x889068_OnEnumerate( sceneId, selfId, targetId )	
		
--	BeginEvent(sceneId)					���棺��������в�Ҫ����BeginEvent�׼� �����֮ǰ��AddNumText��Ϣ 
	
		if GetLevel( sceneId, selfId ) >= 30 then
			AddNumText( sceneId, x889068_g_ScriptId, "��ȡ#c00ffff��¥�����#Y״̬", 6, 100 )
			--AddNumText( sceneId, x889068_g_ScriptId, "#{TGKW_20070918_004}", 11, 106 )
		end	
			
--	EndEvent(sceneId)
--	DispatchEventList(sceneId,selfId,targetId)
		
end

--**********************************
--�¼��������
--**********************************
function x889068_OnDefaultEvent( sceneId, selfId,targetId )

	local key = GetNumText()
       if key == 100 then
	BeginEvent(sceneId)
		AddText(sceneId,"  #c00ff00��ѡ�����Լ������װ����״̬������")
		AddNumText( sceneId, x889068_g_ScriptId, "��ȡ:#c00ffff��¥��#Y��#G���״̬#Y��",6,1 )
		AddNumText( sceneId, x889068_g_ScriptId, "��ȡ:#c00ffff��¥��#Y��#G��Ѩ״̬#Y��",6,2 )
		AddNumText( sceneId, x889068_g_ScriptId, "���:#c00ffff��Ҥ��[��]#Y��#G����#Y��",6,3 )
		AddNumText( sceneId, x889068_g_ScriptId, "���:#c00ffff��Ҥ��[��]#Y��#G����#Y��",6,4 )
		AddNumText( sceneId, x889068_g_ScriptId, "���:#c00ffff��Ҥ��[��]#Y��#G����#Y��",6,5 )
		AddNumText( sceneId, x889068_g_ScriptId, "���:#c00ffff��Ҥ��[��]#Y��#G����#Y��",6,6 )
		--AddNumText( sceneId, x889068_g_ScriptId, "��ȡ:#c00ffff��ɽ������װ#Y��#G�̹�״̬#Y��",6,7 )
		--AddNumText( sceneId, x889068_g_ScriptId, "��ȡ:#c00ffff��ң������װ#Y��#G�̻�״̬#Y��",6,8 )
		--AddNumText( sceneId, x889068_g_ScriptId, "��ȡ:#c00ffff����������װ#Y��#G���״̬#Y��",6,9 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	elseif key == 1 then
		x889068_LingQuZhuangTai1( sceneId, selfId, targetId )
	elseif key == 2 then
		x889068_LingQuZhuangTai2( sceneId, selfId, targetId )
	elseif key == 3 then
		x889068_LingQuZhuangTai3( sceneId, selfId, targetId )
	elseif key == 4 then
		x889068_LingQuZhuangTai4( sceneId, selfId, targetId )
	elseif key == 5 then
		x889068_LingQuZhuangTai5( sceneId, selfId, targetId )
	elseif key == 6 then
		x889068_LingQuZhuangTai6( sceneId, selfId, targetId )
	elseif key == 7 then
		x889068_LingQuZhuangTai7( sceneId, selfId, targetId )
	elseif key == 8 then
		x889068_LingQuZhuangTai8( sceneId, selfId, targetId )
	elseif key == 9 then
		x889068_LingQuZhuangTai9( sceneId, selfId, targetId )
	end	
end


function x889068_LingQuZhuangTai1( sceneId, selfId, targetId )
	if GetItemCount(sceneId, selfId, 10422016) < 1 	then
		x889068_MsgBox( sceneId, selfId, "�Բ��������Я����¥�䣡" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5952, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ��¥��״̬" )
      end
end


function x889068_LingQuZhuangTai2( sceneId, selfId, targetId )
	if GetItemCount(sceneId, selfId, 10423024) < 1 then
		x889068_MsgBox( sceneId, selfId, "�Բ��������Я����¥��" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5953, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ��¥��״̬" )
      end
end

function x889068_LingQuZhuangTai3( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10433320) < 1 then
		x889068_MsgBox( sceneId, selfId, "�Բ��������Я��#Y#eaf0000��Ҥ��[��]��" )	
		return
      else
		AddSkill(  sceneId, selfId, 1614)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ������ܣ�" )
end
end

function x889068_LingQuZhuangTai4( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10433321) < 1 then
		x889068_MsgBox( sceneId, selfId, "�Բ��������Я��#Y#eaf0000��Ҥ��[��]��" )	
		return
      else
		AddSkill(  sceneId, selfId, 1601)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ������ܣ�" )
end
end

function x889068_LingQuZhuangTai5( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10433322) < 1 then
		x889068_MsgBox( sceneId, selfId, "�Բ��������Я��#gFFFFF0��Ҥ��[��]��" )	
		return
      else
		AddSkill(  sceneId, selfId, 1600)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ������ܣ�" )
end
end

function x889068_LingQuZhuangTai6( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10433323) < 1 then
		x889068_MsgBox( sceneId, selfId, "�Բ��������Я��#gFFFFF0��Ҥ��[��]��" )	
		return
      else
		AddSkill(  sceneId, selfId, 1612)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ������ܣ�" )
end
end

function x889068_LingQuZhuangTai7( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514096) < 1 or GetItemCount(sceneId, selfId, 10521096) < 1 or GetItemCount(sceneId, selfId, 10515096) < 1 or GetItemCount(sceneId, selfId, 10522096) < 1	or GetItemCount(sceneId, selfId, 10523096) < 1	then
		x889068_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס���ɽ������һ�����ܶ࣬һ�����ܲ" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2927, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ��ɽ����--�̹�״̬" )
end
end

function x889068_LingQuZhuangTai8( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514097) < 1 or GetItemCount(sceneId, selfId, 10521097) < 1 or GetItemCount(sceneId, selfId, 10515097) < 1 or GetItemCount(sceneId, selfId, 10522097) < 1	or GetItemCount(sceneId, selfId, 10523097) < 1	then
		x889068_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס���ң���ݡ�һ�����ܶ࣬һ�����ܲ" )	
		return
      else
               LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2928, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ��ң����--�̻�״̬" )
end
end

function x889068_LingQuZhuangTai9( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514098) < 1 or GetItemCount(sceneId, selfId, 10521098) < 1 or GetItemCount(sceneId, selfId, 10515098) < 1 or GetItemCount(sceneId, selfId, 10522098) < 1	or GetItemCount(sceneId, selfId, 10523098) < 1	then
		x889068_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס��������ա�һ�����ܶ࣬һ�����ܲ" )	
		return
      else
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2929, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ��������--���״̬" )
end
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x889068_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի���ʾ
--**********************************
function x889068_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end