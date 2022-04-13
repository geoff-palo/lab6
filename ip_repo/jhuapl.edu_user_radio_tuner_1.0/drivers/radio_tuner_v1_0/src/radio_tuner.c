

/***************************** Include Files *******************************/
#include "radio_tuner.h"
/************************** Function Definitions ***************************/

void radioTuner_setAdcFreq(u32 BaseAddress, float freq){
	//RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_ADC_PHASE_OFFSET, (u32)freq*(float)(134217728/125000000));
    // calculate phase
    u32 phase = (u32)freq*(float)(134217728/125000000);
    // read register
    u32 phase_comp = RADIO_TUNER_mReadReg(BaseAddress, RADIO_TUNER_ADC_PHASE_OFFSET);
    // write register if different
    if(phase != phase_comp)
        RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_ADC_PHASE_OFFSET, phase);
}

void radioTuner_tuneRadio(u32 BaseAddress, float tune_frequency){
	//RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_MIXER_PHASE_OFFSET, (u32)tune_frequency*(float)(134217728/125000000));
    // calculate phase
    u32 phase = (u32)tune_frequency*(float)(134217728/125000000);
    // read register
    u32 phase_comp = RADIO_TUNER_mReadReg(BaseAddress, RADIO_TUNER_MIXER_PHASE_OFFSET);
    // write register if different
    if(phase != phase_comp)
        RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_MIXER_PHASE_OFFSET, phase);
}

void radioTuner_controlReset(u32 BaseAddress, u8 resetval){ // 1 = reset
    if(resetval == 1){// write register to 1
    RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_PHASE_RST_OFFSET, 1);
    usleep(100);
    // write register to 0
    RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_PHASE_RST_OFFSET, 0);
    }
}