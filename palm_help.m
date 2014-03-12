function palm_help(varargin)
% Shows a help text. Call palm_help('logo') to show just the logo.

if nargin == 1 && strcmpi(varargin{1},'logo'),
    showlogo;
else
    showlogo;
    fprintf('\n');
    fprintf('The options are:\n');
    fprintf('\n');
    fprintf('-i <file> : Input(s). More than one can be specified, each one preceded\n');
    fprintf('	by its own -i. All input files must contain the same number of\n');
    fprintf('	observations (e.g., the same number of subjects). Except for NPC\n');
    fprintf('	and MV, mixing is allowed (e.g., voxelwise, vertexwise and\n');
    fprintf('	non-imaging data can be all loaded at once, and later will be all\n');
    fprintf('	corrected across).\n');
    fprintf('\n');
    fprintf('-m <file> : Mask(s). Either one for all inputs, or one per input,\n');
    fprintf('	supplied in the same order as the respective -i appear.\n');
    fprintf('\n');
    fprintf('-s <file> : Surface file(s). When more than one is supplied, each -s\n');
    fprintf('	should be entered in the same order as the respective -i. This\n');
    fprintf('	option is needed when the input data is a scalar field over a\n');
    fprintf('	surface and spatial statistics (cluster extent, cluster mass or\n');
    fprintf('	TFCE) have been enabled.\n');
    fprintf('\n');
    fprintf('-d <file> : Design matrix. It can be in csv format, or in fsl''s vest\n');
    fprintf('	format. For information on how to construct the design matrix,\n');
    fprintf('	see the FSL GLM manual.\n');
    fprintf('\n');
    fprintf('-t <file> : t-contrasts file, in csv or vest format (the format used by\n');
    fprintf('	FSL). The option -t can be used more than once, so that more than\n');
    fprintf('	one t-contrasts file can be loaded.\n');
    fprintf('\n');
    fprintf('-f <file> : F-contrasts file, in csv or vest format. The option -f can\n');
    fprintf('	be used more than once, so that more than one F-contrasts file\n');
    fprintf('	can be loaded. Each file supplied with a -f corresponds to the\n');
    fprintf('	file supplied with the option -t in the same order. The option -f\n');
    fprintf('	cannot be used more than the number of times the option -t was\n');
    fprintf('	used.\n');
    fprintf('\n');
    fprintf('-inormal : Apply an inverse-normal transformation to the data using the\n');
    fprintf('	Waerden method.\n');
    fprintf('\n');
    fprintf('-rmethod <string> : Method for regression/permutation. It can be one of\n');
    fprintf('	Freedman-Lane, Smith, terBraak, Manly, Draper-Stoneman,\n');
    fprintf('	Still-White and Huh-Jhun. Default, and recommended, is\n');
    fprintf('	Freedman-Lane.\n');
    fprintf('\n');
    fprintf('-n <integer> : Number of permutations. Use -n 0 to run all permutations\n');
    fprintf('	and/or sign-flips exhaustively. Default is 10000.\n');
    fprintf('\n');
    fprintf('-eb <file> : Exchangeability blocks file, in csv or vest format. If\n');
    fprintf('	omitted, all observations are treated as exchangeable and\n');
    fprintf('	belonging to a single large exchangeability block.\n');
    fprintf('\n');
    fprintf('-sb : Shuffle blocks as a whole if the block specification has a single\n');
    fprintf('	column. If he block specification has a single column, but this\n');
    fprintf('	option is omited, permutations will happen within block.\n');
    fprintf('\n');
    fprintf('-vg <file> : Variance groups file, in csv or vest format. If omitted,\n');
    fprintf('	the variance groups are defined automatically using the\n');
    fprintf('	exchangeability blocks (option -eb).\n');
    fprintf('\n');
    fprintf('-ee : Assume exchangeable errors (EE), to allow permutations.\n');
    fprintf('\n');
    fprintf('-ise : Assume independent and symmetric errors (ISE), to allow\n');
    fprintf('	sign-flipping.\n');
    fprintf('\n');
    fprintf('-npc <method> : Do non-parametric combination (NPC), using the the\n');
    fprintf('	specified method, which can be one of: Tippett, Fisher,\n');
    fprintf('	Pearson-David, Stouffer, Wilkinson <alpha>, Winer, Edgington,\n');
    fprintf('	Mudholkar-George, Friston, Darlington-Hayes <r>, Zaykin <alpha>,\n');
    fprintf('	Dudbridge-Koeleman <r>, Dudbridge-Koeleman2 <r> <alpha>, Nichols,\n');
    fprintf('	Taylor-Tibshirani or Jiang <alpha>. Default is Tippett. Note that\n');
    fprintf('	some methods require 1 or 2 additional parameters to be provided.\n');
    fprintf('	All methods except Darlington-Hayes and Jiang can also be used to\n');
    fprintf('	produce parametric p-values and spatial statistics.\n');
    fprintf('\n');
    fprintf('-mv <statistic> : Do classical multivariate analysis (MV), such as\n');
    fprintf('	MANOVA and MANCOVA, using the the specified statistic, which can\n');
    fprintf('	be one of: Wilks, Hotelling, Pillai, Roy_ii or Roy_iii. All but\n');
    fprintf('	the last can also be used to calculate parametric p-values and\n');
    fprintf('	spatial statistics.\n');
    fprintf('\n');
    fprintf('-o <string> : Output prefix. It may itself be prefixed by a path.\n');
    fprintf('	Default is palm.\n');
    fprintf('\n');
    fprintf('-pearson : Instead of t, F, v or G, compute either the Pearson''s\n');
    fprintf('	correlation coefficient, r (if the constrast has rank=1), or the\n');
    fprintf('	coefficient of determination R2 (if the constrast has rank>1).\n');
    fprintf('	For the contrasts in which some EVs are zeroed out, this option\n');
    fprintf('	computes the partial correlation (or partial R2).\n');
    fprintf('\n');
    fprintf('-T : Enable TFCE inference for univariate (partial) tests, as well as\n');
    fprintf('	for NPC and/or MV if these options have been enabled.\n');
    fprintf('\n');
    fprintf('-c <real> : Enable cluster extent for t contrasts for univariate\n');
    fprintf('	(partial) tests, with the supplied cluster-forming threshold\n');
    fprintf('	(supplied as the equivalent z-score), as well as for NPC and/or\n');
    fprintf('	MV if these options have been enabled.\n');
    fprintf('\n');
    fprintf('-C <real> : Enable cluster mass for t contrasts for univariate\n');
    fprintf('	(partial) tests, with the supplied cluster-forming threshold\n');
    fprintf('	(supplied as the equivalent z-score), as well as for NPC and/or\n');
    fprintf('	MV if these options have been enabled.\n');
    fprintf('\n');
    fprintf('-tfce_H <real> : Set the TFCE H parameter (height power).\n');
    fprintf('\n');
    fprintf('-tfce_E <real> : Set the TFCE E parameter (extent power).\n');
    fprintf('\n');
    fprintf('-tfce_C <integer> : Set the TFCE C parameter (connectivity).\n');
    fprintf('\n');
    fprintf('-tfce2D : Set TFCE parameters for 2D data (surface, TBSS) data, i.e.,\n');
    fprintf('	H = 2, E = 1, C = 26.\n');
    fprintf('\n');
    fprintf('-Tuni : Enable TFCE inference for univariate (partial) tests.\n');
    fprintf('\n');
    fprintf('-cuni <real> : Enable cluster extent for t contrasts for univariate\n');
    fprintf('	(partial) tests, with the supplied cluster-forming threshold (as\n');
    fprintf('	a z-score).\n');
    fprintf('\n');
    fprintf('-Cuni <real> : Enable cluster mass for t contrasts for univariate\n');
    fprintf('	(partial) tests, with the supplied cluster-forming threshold (as\n');
    fprintf('	a z-score).\n');
    fprintf('\n');
    fprintf('-Tnpc : Enable TFCE inference for NPC.\n');
    fprintf('\n');
    fprintf('-cnpc <real> : Enable cluster extent for t contrasts for NPC, with the\n');
    fprintf('	supplied cluster-forming threshold (as a z-score).\n');
    fprintf('\n');
    fprintf('-Cnpc <real> : Enable cluster mass for t contrasts for NPC, with the\n');
    fprintf('	supplied cluster-forming threshold (as a z-score).\n');
    fprintf('\n');
    fprintf('-Tmv : Enable TFCE inference for MV.\n');
    fprintf('\n');
    fprintf('-cmv <real> : Enable cluster extent for t contrasts for MV, with the\n');
    fprintf('	supplied cluster-forming threshold (as a z-score).\n');
    fprintf('\n');
    fprintf('-Cmv <real> : Enable cluster mass for t contrasts for MV, with the\n');
    fprintf('	supplied cluster-forming threshold (as a z-score).\n');
    fprintf('\n');
    fprintf('-corrmod : Apply FWER-correction of p-values over multiple modalities.\n');
    fprintf('\n');
    fprintf('-corrcon : Apply FWER-correction of p-values over multiple contrasts.\n');
    fprintf('\n');
    fprintf('-fdr : Produce FDR-adjusted p-values.\n');
    fprintf('\n');
    fprintf('-saveparametric : Save also uncorrected parametric p-values.\n');
    fprintf('\n');
    fprintf('-save1-p : Save (1-p) instead of the actual p-values.\n');
    fprintf('\n');
    fprintf('-logp : Save the output p-values as -log(p) (or -log(1-p) if the option\n');
    fprintf('	-save1-p is used).\n');
    fprintf('\n');
    fprintf('-savemask : Save the effective masks used for each modality, as well as\n');
    fprintf('	an intersection mask used for NPC and/or MV of these have been\n');
    fprintf('	selected.\n');
    fprintf('\n');
    fprintf('-noniiclass : Do not use the NIFTI class (use this option only if you\n');
    fprintf('	have problems and even so, only for small datasets).\n');
    fprintf('\n');
    fprintf('-draft : Run in the "draft mode". No NPC, nor FWER correction are\n');
    fprintf('	possible. MV and FDR-adjustment are possible.\n');
    fprintf('\n');
    fprintf('-saveperms : Save one statistic image per permutation, as well as a csv\n');
    fprintf('	file with the permutation indices (one permutation per row, one\n');
    fprintf('	index per column; sign-flips are represented by the negative\n');
    fprintf('	indices). Use cautiously, as this may consume large amounts of\n');
    fprintf('	disk space.\n');
    fprintf('\n');
    fprintf('-savemetrics : Save a csv file with various permutation metrics.\n');
    fprintf('\n');
    fprintf('-seed <positive> : Seed used for the random number generator. Use a\n');
    fprintf('	positive integer up to 232^. Default is 0. To start with a random\n');
    fprintf('	number, use the word twist instead of the integer. Note that a\n');
    fprintf('	given seed used in matlab isn''t equivalent to the same seed used\n');
    fprintf('	in Octave.\n');
    fprintf('\n');
    fprintf('-demean : Mean center the data, as well as all columns of the design\n');
    fprintf('	matrix. If the original design had an intercept, the intercept is\n');
    fprintf('	removed.\n');
    fprintf('\n');
    fprintf('-vgdemean : Mean center the data, as well as all columns of the design\n');
    fprintf('	matrix, within each VG. Intercepts are removed.\n');
    fprintf('\n');
    fprintf('-cmc : Use Conditional Monte Carlo. This option will be ignored if the\n');
    fprintf('	number of shufflings chosen is larger than the maximum number of\n');
    fprintf('	possible shufflings, in which case all possible shufflings will\n');
    fprintf('	be performed.\n');
    fprintf('\n');
    fprintf('-igrepx : Ignore the possibility of repeated rows in X when\n');
    fprintf('	constructing the set of permutations, such that each row is\n');
    fprintf('	treated as unique, regardless of potential repetitions (ties).\n');
    fprintf('\n');
    fprintf('-twotail : Run two-tailed tests for all the t-contrasts instead of\n');
    fprintf('	one-tailed. If NPC is used, it also becomes two-tailed for the\n');
    fprintf('	methods which statistic are symmetric around zero under the null.\n');
    fprintf('\n');
    fprintf('-ev4vg : Add to the design one EV modelling the mean of each VG.\n');
    fprintf('\n');
    fprintf('-removeignored : Remove from the data and design those observations\n');
    fprintf('	that have their own, exclusive regressor, but which don''t belong\n');
    fprintf('	to any contrast.\n');
    fprintf('\n');
    fprintf('-removevgsize1 : Remove from the data and design those observations\n');
    fprintf('	that are in VGs of size 1.\n');
    fprintf('\n');
    fprintf('-zstat : Convert the original statistic (t, F, v, G, r, R2, or any of\n');
    fprintf('	the MV statistics) to a normally distributed, z-statistic.\n');
    fprintf('\n');
    fprintf('-noranktest : For MV, don''t check the rank of the data before trying to\n');
    fprintf('	compute the multivariate statistics.\n');
    fprintf('\n');
    fprintf('-evperdat : Treat the design matrix supplied with -d as having one column\n');
    fprintf('	for each column in the observed data (entered with -i). This\n');
    fprintf('	enables voxelwise/facewise/vertexwise regressors.\n');
    fprintf('\n');
    fprintf('_____________________________________\n');
    fprintf('Anderson M. Winkler\n');
    fprintf('FMRIB / Univ. of Oxford\n');
    fprintf('Mar/2014\n');
    fprintf('http://brainder.org\n');
end

function showlogo
% Show just the logo
fprintf('=======================================================================\n');
fprintf('             ___         ___                         ___\n');
fprintf('            /  /\\       /  /\\                       /__/\\\n');
fprintf('           /  /::\\     /  /::\\                     |  |::\\\n');
fprintf('          /  /:/\\:\\   /  /:/\\:\\    ___     ___     |  |:|:\\\n');
fprintf('         /  /:/~/:/  /  /:/~/::\\  /__/\\   /  /\\  __|__|:|\\:\\\n');
fprintf('        /__/:/ /:/  /__/:/ /:/\\:\\ \\  \\:\\ /  /:/ /__/::::| \\:\\\n');
fprintf('        \\  \\:\\/:/   \\  \\:\\/:/__\\/  \\  \\:\\  /:/  \\  \\:\\~~\\__\\/\n');
fprintf('         \\  \\::/     \\  \\::/        \\  \\:\\/:/    \\  \\:\\\n');
fprintf('          \\  \\:\\      \\  \\:\\         \\  \\::/      \\  \\:\\\n');
fprintf('           \\  \\:\\      \\  \\:\\         \\__\\/        \\  \\:\\\n');
fprintf('            \\__\\/       \\__\\/                       \\__\\/\n');
fprintf('\n');
fprintf('=======================================================================\n');
fprintf('                 Permutation Analysis of Linear Models\n');
fprintf('=======================================================================\n');