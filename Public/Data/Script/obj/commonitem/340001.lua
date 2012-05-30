--�����ټ���ű���ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--340001.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x340001_g_scriptId = 340001 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--��Ҫ�ĵȼ�

--Ч����ID
x340001_g_Impact1 = 340001 --��ʱд���
x340001_g_Impact2 = -1 --����

x340001_g_Impact_NotTransportList = { 5929 } -- ��ֹ���͵�Impact
x340001_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--**********************************
--�¼��������
--**********************************
function x340001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x340001_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x340001_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x340001_OnConditionCheck( sceneId, selfId )

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			strText = "����������״̬�У�������ʹ�ô��͹��ܡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end
	
	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "����������Ʊ���������̣�������ʹ�ô��͹��ܡ�" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x340001_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x340001_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x340001_OnDeplete( sceneId, selfId )

  local Level = GetLevel( sceneId, selfId )
  local MenPai = LuaFnGetMenPai( sceneId, selfId )
  
  if Level < 10 then
      return 0
  end
  
  if MenPai < 0 or MenPai >8 then           
 		  BeginEvent(sceneId)
			  strText = format("û�м������ɣ�����ʹ�ô���Ʒ")
			  AddText(sceneId,strText)
 		  EndEvent(sceneId)

 		  DispatchMissionTips(sceneId,selfId)
 		  
      return 0
  end
  
  if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			strText = "����������״̬�У�������ʹ�ô��͹��ܡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end
  
  	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "����������Ʊ���������̣�������ʹ�ô��͹��ܡ�" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
  
  --���Impact״̬פ��Ч��
	for i, ImpactId in x340001_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x340001_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
  
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end



function x340001_MenpaiTransfer( sceneId, selfId )
            
    local MenPai = LuaFnGetMenPai( sceneId, selfId )
    
    local TargetScene
    local x
    local z
    
    if( MenPai >= 0 and MenPai <=8 ) then
        if 0 == MenPai then      --����
            TargetScene = 9
            x = 93
            z = 72  
        end
        
        if 1 == MenPai then      --����
            TargetScene = 11
            x = 106
            z = 59          
        end

        if 2 == MenPai then      --ؤ��
            TargetScene = 10
            x = 91
            z = 100          
        end

        if 3 == MenPai then      --�䵱
            TargetScene = 12
            x = 80
            z = 87                  
        end

        if 4 == MenPai then      --����
            TargetScene = 15
            x = 96
            z = 48                  
        end

        if 5 == MenPai then      --����
            TargetScene = 16
            x = 86
            z = 73                  
        end

        if 6 == MenPai then      --����
            TargetScene = 13
            x = 96
            z = 88                  
        end

        if 7 == MenPai then      --��ɽ
            TargetScene = 17
            x = 89
            z = 47                  
        end

        if 8 == MenPai then      --��ң
            TargetScene = 14
            x = 122
            z = 141                  
        end        
        
       
       if sceneId == TargetScene then
           
           SetPos( sceneId, selfId, x, z )
           return
       end
       
        CallScriptFunction((400900), "TransferFunc",sceneId, selfId, TargetScene, x, z) 
		--����ͳ��
		LuaFnAuditItemUseMenPaiZhaoJiLing(sceneId, selfId, MenPai)
        
    
    end        
    
    
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x340001_OnActivateOnce( sceneId, selfId )

	if(-1~=x340001_g_Impact1) then
		--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x340001_g_Impact1, 0);
		x340001_MenpaiTransfer( sceneId, selfId )
	end
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x340001_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
