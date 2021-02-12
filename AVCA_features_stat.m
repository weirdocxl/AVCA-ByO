function [ vFeatures, caNamesFeatures ] = AVCA_features_stat( sFile, sType )

% Calculates statistics (mean and standard deviation) of the features
% calculated with the AVCA library.
%
% INPUT:
%       - sFile: path to audio file
%       - sType: indicates the type of features to be included in
%       vFeatures:
%            P: Perturbation-fluctuation
%            R: Regularity
%            N: Complexity
%            S: Spectral-Cepstral features
%            MS: Modulation spectra features
%
% OUTPUTS:
%       - vFeatures: vector including the features
%       - caNamesFeatures: cell array containing the name of the features
%       included in vFeatures.
%
if nargin==1
    sType='PRNSM';
end

vFeatures=[];
caNamesFeatures=[];
if contains(sType,'P')
    vFeatures=PerturbationFluctuationVoice_avca(sFile);
    caNamesFeatures={'rJitta'; 'rJitt'; 'rRrRAP'; 'rPPQ'; 'rSPPQ';'rShdB'; 'rShim';... % Perturbation - fluctuation
    'rAPQ'; 'rSAPQ'; 'rFTRI'; 'rATRI'; 'rFftr'; 'rFatr'; 'NNE_mean'; 'NNE_std';...
    'HNR_mean'; 'HNR_std'; 'CHNR_mean'; 'CHNR_std'; 'GNE_mean'; 'GNE_std'};
end

if contains(sType,'R')
    vFeatures=[vFeatures, RegularityVoice_avca_stats(sFile)];
    caNamesFeatures=[caNamesFeatures; {'rApEn_mean'; 'rApEn_std'; 'rSampEn_mean'; 'rSampEn_std';... % Regularity
    'rFuzzyEn_mean'; 'rFuzzyEn_std'; 'rGSampEn_mean'; 'rGSampEn_std'; 'rmSampEn_mean'; 'rmSampEn_std'}];
end

if contains(sType,'N')
    vFeatures=[vFeatures, NDAVoice_avca_stats(sFile)];
    caNamesFeatures=[caNamesFeatures; {'CorrDim_mean'; 'CorrDim_std'; 'LLE_mean'; 'LLE_std'; 'Hurst_mean'; 'Hurst_std';... % NDA
    'mDFA_mean'; 'mDFA_std'; 'RPDE_mean'; 'RPDE_std'; 'PE_mean'; 'PE_std'; 'MarkEnt_mean'; 'MarkEnt_std'}];
end

if contains(sType, 'S')
    vFeatures=[vFeatures, statsFeats(SpectralCesptralVoice_avca(sFile))];
    caNamesFeatures=[caNamesFeatures; {'MFCC1_mean';'MFCC1_std';'MFCC2_mean';'MFCC2_std';'MFCC3_mean';'MFCC3_std';... % Spectral - Cepstral
    'MFCC4_mean';'MFCC4_std';'MFCC5_mean';'MFCC5_std';'MFCC6_mean';'MFCC6_std';...
    'MFCC7_mean';'MFCC7_std';'MFCC8_mean';'MFCC8_std';'MFCC9_mean';'MFCC9_std';...
    'MFCC10_mean';'MFCC10_std';'MFCC11_mean';'MFCC11_std';'MFCC12_mean';'MFCC12_std';...
    'MFCC1_d_mean';'MFCC1_d_std';'MFCC2_d_mean';'MFCC2_d_std';'MFCC3_d_mean';'MFCC3_d_std';...
    'MFCC4_d_mean';'MFCC4_d_std';'MFCC5_d_mean';'MFCC5_d_std';'MFCC6_d_mean';'MFCC6_d_std';...
    'MFCC7_d_mean';'MFCC7_d_std';'MFCC8_d_mean';'MFCC8_d_std';'MFCC9_d_mean';'MFCC9_d_std';...
    'MFCC10_d_mean';'MFCC10_d_std';'MFCC11_d_mean';'MFCC11_d_std';'MFCC12_d_mean';'MFCC12_d_std';...
    'MFCC1_dd_mean';'MFCC1_dd_std';'MFCC2_dd_mean';'MFCC2_dd_std';'MFCC3_dd_mean';'MFCC3_dd_std';...
    'MFCC4_dd_mean';'MFCC4_dd_std';'MFCC5_dd_mean';'MFCC5_dd_std';'MFCC6_dd_mean';'MFCC6_dd_std';...
    'MFCC7_dd_mean';'MFCC7_dd_std';'MFCC8_dd_mean';'MFCC8_dd_std';'MFCC9_dd_mean';'MFCC9_dd_std';...
    'MFCC10_dd_mean';'MFCC10_dd_std';'MFCC11_dd_mean';'MFCC11_dd_std';'MFCC12_dd_mean';'MFCC12_dd_std';...
    'PLP1_mean';'PLP1_std';'PLP2_mean';'PLP2_std';'PLP3_mean';'PLP3_std';...
    'PLP4_mean';'PLP4_std';'PLP5_mean';'PLP5_std';'PLP6_mean';'PLP6_std';...
    'PLP7_mean';'PLP7_std';'PLP8_mean';'PLP8_std';'PLP9_mean';'PLP9_std';...
    'PLP10_mean';'PLP10_std';'PLP11_mean';'PLP11_std';'PLP12_mean';'PLP12_std';...
    'PLP1_d_mean';'PLP1_d_std';'PLP2_d_mean';'PLP2_d_std';'PLP3_d_mean';'PLP3_d_std';...
    'PLP4_d_mean';'PLP4_d_std';'PLP5_d_mean';'PLP5_d_std';'PLP6_d_mean';'PLP6_d_std';...
    'PLP7_d_mean';'PLP7_d_std';'PLP8_d_mean';'PLP8_d_std';'PLP9_d_mean';'PLP9_d_std';...
    'PLP10_d_mean';'PLP10_d_std';'PLP11_d_mean';'PLP11_d_std';'PLP12_d_mean';'PLP12_d_std';...
    'PLP1_dd_mean';'PLP1_dd_std';'PLP2_dd_mean';'PLP2_dd_std';'PLP3_dd_mean';'PLP3_dd_std';...
    'PLP4_dd_mean';'PLP4_dd_std';'PLP5_dd_mean';'PLP5_dd_std';'PLP6_dd_mean';'PLP6_dd_std';...
    'PLP7_dd_mean';'PLP7_dd_std';'PLP8_dd_mean';'PLP8_dd_std';'PLP9_dd_mean';'PLP9_dd_std';...
    'PLP10_dd_mean';'PLP10_dd_std';'PLP11_dd_mean';'PLP11_dd_std';'PLP12_dd_mean';'PLP12_dd_std'}];
end

if contains(sType,'M')
    vFeatures=[vFeatures, statsFeats(MSVoice_avca(sFile))]; % The algorithm  may provide NaNs when there is no voice signal (silences)
     caNamesFeatures=[caNamesFeatures; {'MSCent1_mean'; 'MSCent1_std';'MSCent2_mean'; 'MSCent2_std';'MSCent3_mean'; 'MSCent3_std';... % Modulation Spectra
    'MSCent4_mean'; 'MSCent4_std';'MSCent5_mean'; 'MSCent5_std';'MSCent6_mean'; 'MSCent6_std';...
    'MSCent7_mean'; 'MSCent7_std';'MSCent8_mean'; 'MSCent8_std';'MSCent9_mean'; 'MSCent9_std';...
    'MSCent10_mean'; 'MSCent10_std';'MSCent11_mean'; 'MSCent12_std';'MSCent12_mean'; 'MSCent12_std';...
    'MSDR1_mean';'MSDR1_std';'MSDR2_mean';'MSDR2_std';'MSDR3_mean';'MSDR3_std';...
    'MSDR4_mean';'MSDR4_std';'MSDR5_mean';'MSDR5_std';'MSDR6_mean';'MSDR6_std';...
    'MSDR7_mean';'MSDR7_std';'MSDR8_mean';'MSDR8_std';'MSDR9_mean';'MSDR9_std';...
    'MSDR10_mean';'MSDR10_std';'MSDR11_mean';'MSDR11_std';'MSDR12_mean';'MSDR12_std';...
    'LMR_mean';'LMR_std';'MSWmod_mean';'MSWmod_std';'MSHmod_mean';'MSHmod_std';...
    'MSWphase_mean';'MSWphase_std';'MSHphase_mean';'MSHphase_std';'CIL_mean'; 'CIL_std';...
    'PALA_mean';'PALA_std';'RALA_mean';'RALA_std';'RALP25_mean';'RALP25_std';...
    'RALP75_mean';'RALP75_std';'RALP95_mean';'RALP95_std'}];
end

end
