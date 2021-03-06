function [data] = loadpickle(filename)
    if ~exist(filename,'file')
        error('%s is not a file',filename);
    end
    outname = replace(filename,'pkl','mat');
    pyscript = ['import pickle as pickle;import sys;import scipy.io;file=open("' filename '","r");dat=pickle.load(file);file.close();scipy.io.savemat("' outname '",dat)'];
    system(['LD_LIBRARY_PATH=/opt/intel/composer_xe_2013/mkl/lib/intel64:/opt/intel/composer_xe_2013/lib/intel64;python -c ''' pyscript '''']);
    data = load(outname);
end