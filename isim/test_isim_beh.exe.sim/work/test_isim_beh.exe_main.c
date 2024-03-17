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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_00000000001358910285_1420689212_init();
    xilinxcorelib_ver_m_00000000001687936702_1862936372_init();
    xilinxcorelib_ver_m_00000000002621774987_4250428007_init();
    xilinxcorelib_ver_m_00000000001603977570_0652135575_init();
    work_m_00000000000403262735_0317860448_init();
    work_m_00000000000786302764_1733832700_init();
    work_m_00000000001445968942_0715192755_init();
    work_m_00000000003724314430_3580741337_init();
    work_m_00000000003756414649_0886308060_init();
    xilinxcorelib_ver_m_00000000002621774987_2873523197_init();
    xilinxcorelib_ver_m_00000000001603977570_4158639433_init();
    work_m_00000000000403262735_2356217838_init();
    work_m_00000000001027041840_3508565487_init();
    work_m_00000000000467578492_1985558087_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000467578492_1985558087");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
