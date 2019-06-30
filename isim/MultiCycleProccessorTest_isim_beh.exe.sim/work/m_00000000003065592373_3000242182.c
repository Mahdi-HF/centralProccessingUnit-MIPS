/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//VBoxSvr/SharedWithVM/Memari_Project/MemariProject/Shifte2New.v";
static unsigned int ng1[] = {0U, 0U};



static void Always_24_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1548);
    *((int *)t2) = 1;
    t3 = (t0 + 1380);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(25, ng0);

LAB5:    xsi_set_current_line(26, ng0);
    t5 = ((char*)((ng1)));
    t6 = (t0 + 600U);
    t7 = *((char **)t6);
    xsi_vlogtype_concat(t4, 28, 28, 2U, t7, 26, t5, 2);
    t6 = (t0 + 828);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 28);
    goto LAB2;

}


extern void work_m_00000000003065592373_3000242182_init()
{
	static char *pe[] = {(void *)Always_24_0};
	xsi_register_didat("work_m_00000000003065592373_3000242182", "isim/MultiCycleProccessorTest_isim_beh.exe.sim/work/m_00000000003065592373_3000242182.didat");
	xsi_register_executes(pe);
}
