-- 005116
-- ����BOSS

x005116_g_PreTimeHour_1 = 0
x005116_g_PreTimeHour_2 = 0
x005116_g_PreTimeHour_3 = 0

x005116_g_Boss ={
								{x=141,z=96,	b1=885,b2=887,b3=889,n1="�����콭С��",n2="��������С��",n3="��������С��"},
								{x=250,z=98,	b1=885,b2=887,b3=889,n1="�����콭С��",n2="��������С��",n3="��������С��"},
								
								{x=206,z=253,	b1=885,b2=887,b3=889,n1="�Ϻ��콭С��",n2="�Ϻ�����С��",n3="�Ϻ�����С��"},
								{x=101,z=256,	b1=885,b2=887,b3=889,n1="�����콭С��",n2="��������С��",n3="��������С��"},
								
								{x=139,z=133,	b1=884,b2=886,b3=888,n1="�콭��",n2="������",n3="������"}}

-- ʹ��һЩ������Ψһ��ȫ�ֱ�������������

-- ����ļ�ʱ���ڵ�һ��ҽ��뱾�������Լ������������رա�
function x005116_OnSceneTimer(sceneId)

	-- ��õ�ǰʱ��
	--begin modified by zhangguoxin 090207
	--local nHour = GetHourTime()
	local nHour = GetQuarterTime()
	--local temp = floor(nHour/100)*100
	
	-- ֻ���� 10:00 4:00 ֱ�ӵ����ʱ���ڲŶ�
	--if nHour-temp>16 and nHour-temp<40    then
	--	return
	--end
	
	local nQuarter = mod(nHour,100);
	-- ֻ���� 10:00 4:00 ֱ�ӵ����ʱ���ڲŶ�
	if nQuarter > 16 and nQuarter < 40    then
		return
	end
	--end modified by zhangguoxin 090207
	
	--����ֲ���ˢ��ʱ��ˢ��5��BOSS��
	--	��45���ӣ�����BOSS��55����53С�ܳ��֡�()
	--	50���ӣ�����BOSS��55����53С�ܳ��֡�	()
	--	55���ӣ�һ��BOSS��60����58С�ܳ��֡�	()
	--	���һ��BOSS����ʱϵͳ���档	
	
	-- ��45���ӣ�ˢ��һ��BOSS
	if GetMinute() >= 45 and GetMinute() < 50  then 
		-- ��Сʱ��������Ѿ�ˢ��
		if nHour == x005116_g_PreTimeHour_1  then
			return
		end
		
		-- ��¼���ʱ���
		x005116_g_PreTimeHour_1 = nHour
		
		-- ����ǲ������㴴���ֵ�����
		-- ��ⳡ���� x005116_g_Boss[1].b1 �ǲ��ǻ����ڣ�
		-- ���ھͲ����������������С��Ȼ��ˢ���µ���
		if x005116_IsHaveMonster( sceneId, "�����콭С��" ) == 0  then
			x005116_UpDateMonster( sceneId, 1, 10 )
		end
		if x005116_IsHaveMonster( sceneId, "�����콭С��" ) == 0  then
			x005116_UpDateMonster( sceneId, 2, 11 )
		end

		
	end
	
	-- 55���ӣ�ˢ�ڶ���BOSS
	if GetMinute() >= 50 and GetMinute() < 55  then
		-- ��Сʱ��������Ѿ�ˢ��
		if nHour == x005116_g_PreTimeHour_2  then
			return
		end
		
		-- ��¼���ʱ���
		x005116_g_PreTimeHour_2 = nHour
		
		-- ����ǲ������㴴���ֵ�����
		if x005116_IsHaveMonster( sceneId, "�Ϻ��콭С��" ) == 0  then
			x005116_UpDateMonster( sceneId, 3, 12 )
		end
		if x005116_IsHaveMonster( sceneId, "�����콭С��" ) == 0  then
			x005116_UpDateMonster( sceneId, 4, 13 )
		end
		
	end
	
	-- 60���ӣ�ˢ������BOSS
	if GetMinute() >= 55 	then
		-- ��Сʱ��������Ѿ�ˢ��
		if nHour == x005116_g_PreTimeHour_3  then
			return
		end
		
		-- ��¼���ʱ���
		x005116_g_PreTimeHour_3 = nHour
		
		-- ����ǲ������㴴���ֵ�����
		if x005116_IsHaveMonster( sceneId, "�콭��" ) == 0  then
			x005116_UpDateMonster( sceneId, 5, 14 )
		end
	end
	
		
end

function x005116_IsHaveMonster( sceneId, MonsterName )
	local nMonsterNum = GetMonsterCount(sceneId)
	local bHaveMonster = 0
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)  == MonsterName  then
			bHaveMonster = 1
		end
	end
	return bHaveMonster
end

function x005116_UpDateMonster( sceneId, nIndex, nGroupId )

	-- ������������ͷ������С��
	local nMonsterNum = GetMonsterCount(sceneId)
	local bHaveMonster = 0
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId) == x005116_g_Boss[nIndex].n1  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
		
		if GetName(sceneId, nMonsterId) == x005116_g_Boss[nIndex].n2  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
		
		if GetName(sceneId, nMonsterId) == x005116_g_Boss[nIndex].n3  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end
	
	-- �ѹ�ȫ��������
	local nMonId
	nMonId = LuaFnCreateMonster(sceneId, x005116_g_Boss[nIndex].b1, x005116_g_Boss[nIndex].x, x005116_g_Boss[nIndex].z, 19, 197, 005117)
	SetCharacterName(sceneId, nMonId, x005116_g_Boss[nIndex].n1)
	SetMonsterGroupID(sceneId, nMonId, nGroupId)
	SetCharacterTitle(sceneId, nMonId, "��������")
	
	nMonId = LuaFnCreateMonster(sceneId, x005116_g_Boss[nIndex].b2, x005116_g_Boss[nIndex].x+2, x005116_g_Boss[nIndex].z, 19, 198, 005118)
	SetCharacterName(sceneId, nMonId, x005116_g_Boss[nIndex].n2)
	SetMonsterGroupID(sceneId, nMonId, nGroupId)
	SetCharacterTitle(sceneId, nMonId, "��������")
	
	nMonId = LuaFnCreateMonster(sceneId, x005116_g_Boss[nIndex].b3, x005116_g_Boss[nIndex].x-2, x005116_g_Boss[nIndex].z, 19, 199, 005119)
	SetCharacterName(sceneId, nMonId, x005116_g_Boss[nIndex].n3)
	SetMonsterGroupID(sceneId, nMonId, nGroupId)
	SetCharacterTitle(sceneId, nMonId, "��������")
	
	if nIndex == 5   then
		--��������������ˮ�����콭�����Ѿ����첿�³����ھ�����������Ӣ����ȥ����
		-- ˢ��BOSS��ʱ�򣬸�һ�����繫��
		
		local str = "#P��������������ˮ��#{_BOSS14}#P�Ѿ����첿�³�����#G����#P��������Ӣ����ȥ����"
		BroadMsgByChatPipe(sceneId, -1, str, 4)
	end
	
	
end

