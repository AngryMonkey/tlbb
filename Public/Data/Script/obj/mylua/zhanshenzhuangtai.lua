x889070_g_ScriptId = 889070

--**********************************
--�о��¼�
--**********************************
function x889070_OnEnumerate( sceneId, selfId, targetId )	
		
--	BeginEvent(sceneId)					���棺��������в�Ҫ����BeginEvent�׼� �����֮ǰ��AddNumText��Ϣ 
	
		if GetLevel( sceneId, selfId ) >= 30 then
			AddNumText( sceneId, x889070_g_ScriptId, "��ȡ#c00ffffս��#Y״̬", 6, 100 )
			--AddNumText( sceneId, x889070_g_ScriptId, "#{TGKW_20070918_004}", 11, 106 )
		end	
			
--	EndEvent(sceneId)
--	DispatchEventList(sceneId,selfId,targetId)
		
end

--**********************************
--�¼��������
--**********************************
function x889070_OnDefaultEvent( sceneId, selfId,targetId )

	local key = GetNumText()
       if key == 100 then
	BeginEvent(sceneId)
		AddText(sceneId,"  #c00ff00��ѡ�����Լ������װ����״̬������һ��Ŷ������")
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffff���ּ�����װ#Y��#G�ն�״̬#Y��",6,1 )
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffff���̷�����װ#Y��#G�ٻ�״̬#Y��",6,2 )
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffffؤ��Х����װ#Y��#G�׶�״̬#Y��",6,3 )
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffff�䵱��ħ��װ#Y��#G����״̬#Y��",6,4 )
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffff���ұ�����װ#Y��#G��˪״̬#Y��",6,5 )
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffff���޹�����װ#Y��#G����״̬#Y��",6,6 )
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffff��ɽ������װ#Y��#G�̹�״̬#Y��",6,7 )
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffff��ң������װ#Y��#G�̻�״̬#Y��",6,8 )
		AddNumText( sceneId, x889070_g_ScriptId, "��ȡ:#c00ffff����������װ#Y��#G���״̬#Y��",6,9 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	elseif key == 1 then
		x889070_LingQuZhuangTai1( sceneId, selfId, targetId )
	elseif key == 2 then
		x889070_LingQuZhuangTai2( sceneId, selfId, targetId )
	elseif key == 3 then
		x889070_LingQuZhuangTai3( sceneId, selfId, targetId )
	elseif key == 4 then
		x889070_LingQuZhuangTai4( sceneId, selfId, targetId )
	elseif key == 5 then
		x889070_LingQuZhuangTai5( sceneId, selfId, targetId )
	elseif key == 6 then
		x889070_LingQuZhuangTai6( sceneId, selfId, targetId )
	elseif key == 7 then
		x889070_LingQuZhuangTai7( sceneId, selfId, targetId )
	elseif key == 8 then
		x889070_LingQuZhuangTai8( sceneId, selfId, targetId )
	elseif key == 9 then
		x889070_LingQuZhuangTai9( sceneId, selfId, targetId )
	end	
end


function x889070_LingQuZhuangTai1( sceneId, selfId, targetId )
	if GetItemCount(sceneId, selfId, 10514090) < 1 or GetItemCount(sceneId, selfId, 10521090) < 1 or GetItemCount(sceneId, selfId, 10515090) < 1 or GetItemCount(sceneId, selfId, 10522090) < 1	or GetItemCount(sceneId, selfId, 10523090) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס����ּ���һ�����ܶ࣬һ�����ܲ" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2921, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ���ּ���--�ն�״̬" )
      end
end


function x889070_LingQuZhuangTai2( sceneId, selfId, targetId )
	if GetItemCount(sceneId, selfId, 10514091) < 1 or GetItemCount(sceneId, selfId, 10521091) < 1 or GetItemCount(sceneId, selfId, 10515091) < 1 or GetItemCount(sceneId, selfId, 10522091) < 1	or GetItemCount(sceneId, selfId, 10523091) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס����̷��ɡ�һ�����ܶ࣬һ�����ܲ" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2922, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ���̷���--�ٻ�״̬" )
      end
end

function x889070_LingQuZhuangTai3( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514092) < 1 or GetItemCount(sceneId, selfId, 10521092) < 1 or GetItemCount(sceneId, selfId, 10515092) < 1 or GetItemCount(sceneId, selfId, 10522092) < 1	or GetItemCount(sceneId, selfId, 10523092) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס�ؤ��Х�족һ�����ܶ࣬һ�����ܲ" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2923, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡؤ��Х��--�׶�״̬" )
end
end

function x889070_LingQuZhuangTai4( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514093) < 1 or GetItemCount(sceneId, selfId, 10521093) < 1 or GetItemCount(sceneId, selfId, 10515093) < 1 or GetItemCount(sceneId, selfId, 10522093) < 1	or GetItemCount(sceneId, selfId, 10523093) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס��䵱��ħ��һ�����ܶ࣬һ�����ܲ" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2924, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ�䵱��ħ--����״̬" )
end
end

function x889070_LingQuZhuangTai5( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514094) < 1 or GetItemCount(sceneId, selfId, 10521094) < 1 or GetItemCount(sceneId, selfId, 10515094) < 1 or GetItemCount(sceneId, selfId, 10522094) < 1	or GetItemCount(sceneId, selfId, 10523094) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס����ұ���һ�����ܶ࣬һ�����ܲ" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2925, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ���ұ���--��˪״̬" )
end
end

function x889070_LingQuZhuangTai6( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514095) < 1 or GetItemCount(sceneId, selfId, 10521095) < 1 or GetItemCount(sceneId, selfId, 10515095) < 1 or GetItemCount(sceneId, selfId, 10522095) < 1	or GetItemCount(sceneId, selfId, 10523095) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס����޹��顱һ�����ܶ࣬һ�����ܲ" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2926, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ���޹���--����״̬" )
end
end

function x889070_LingQuZhuangTai7( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514096) < 1 or GetItemCount(sceneId, selfId, 10521096) < 1 or GetItemCount(sceneId, selfId, 10515096) < 1 or GetItemCount(sceneId, selfId, 10522096) < 1	or GetItemCount(sceneId, selfId, 10523096) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס���ɽ������һ�����ܶ࣬һ�����ܲ" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2927, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ��ɽ����--�̹�״̬" )
end
end

function x889070_LingQuZhuangTai8( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514097) < 1 or GetItemCount(sceneId, selfId, 10521097) < 1 or GetItemCount(sceneId, selfId, 10515097) < 1 or GetItemCount(sceneId, selfId, 10522097) < 1	or GetItemCount(sceneId, selfId, 10523097) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס���ң���ݡ�һ�����ܶ࣬һ�����ܲ" )	
		return
      else
               LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2928, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ��ң����--�̻�״̬" )
end
end

function x889070_LingQuZhuangTai9( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514098) < 1 or GetItemCount(sceneId, selfId, 10521098) < 1 or GetItemCount(sceneId, selfId, 10515098) < 1 or GetItemCount(sceneId, selfId, 10522098) < 1	or GetItemCount(sceneId, selfId, 10523098) < 1	then
		x889070_MsgBox( sceneId, selfId, "�Բ�������贩��һ�ס��������ա�һ�����ܶ࣬һ�����ܲ" )	
		return
      else
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2929, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ��������--���״̬" )
end
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x889070_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի���ʾ
--**********************************
function x889070_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end