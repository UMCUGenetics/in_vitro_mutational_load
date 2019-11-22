#!/bin/bash

cd /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/
mkdir runs/

mkdir runs/STE0072/
mkdir runs/STE0072/STE0072_C12
mkdir runs/STE0072/STE0072_C23
mkdir runs/STE0072/STE0072_C31
mkdir runs/STE0072/STE0072_SC12A
mkdir runs/STE0072/STE0072_SC23B
mkdir runs/STE0072/STE0072_SC31A

mkdir runs/STE0076/
mkdir runs/STE0076/STE0076_C12
mkdir runs/STE0076/STE0076_C23
mkdir runs/STE0076/STE0076_C32
mkdir runs/STE0076/STE0076_SC12C
mkdir runs/STE0076/STE0076_SC23A
mkdir runs/STE0076/STE0076_SC32A

mkdir runs/C30913D/
mkdir runs/C30913D/C30913D_C10
mkdir runs/C30913D/C30913D_C12
mkdir runs/C30913D/C30913D_SC109
mkdir runs/C30913D/C30913D_SC125

mkdir runs/17513D/
mkdir runs/17513D/17513D_C10
mkdir runs/17513D/17513D_C3
mkdir runs/17513D/17513D_SC105
mkdir runs/17513D/17513D_SC33

mkdir runs/IPS/
mkdir runs/IPS/IPS_C_A1
mkdir runs/IPS/IPS_C_A3
mkdir runs/IPS/IPS_C_B3
mkdir runs/IPS/IPS_SC_A1
mkdir runs/IPS/IPS_SC_A3
mkdir runs/IPS/IPS_SC_B3
#newruns/
mkdir runs/IPS/IPS_CLONEHA1
mkdir runs/IPS/IPS_HA1SUBCLONE3

mkdir runs/MASEV/
mkdir runs/MASEV/MASEVREF_CLONEN4SUBCLONE1
mkdir runs/MASEV/MASEVREF_CLONEH2SUBCLONE2
mkdir runs/MASEV/MASEVREF_CLONEN4
mkdir runs/MASEV/MASEVREF_CLONEH2

mkdir runs/H9/
mkdir runs/H9/H9BULK_H9CLONEH2
mkdir runs/H9/H9BULK_H9CLONEH2SUBCLONE2
mkdir runs/H9/H9BULK_H9CLONEN2
mkdir runs/H9/H9BULK_H9CLONEN2SUBCLONE3

####
#cope snvfi_ini_files

inifile="/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/scripts/somatic_calling_SNVfi/example_inifile.ini"
inidir="/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/ini_files"

#cp $inifile $inidir/STE0072_C12.ini
#cp $inifile $inidir/STE0072_C23.ini
#cp $inifile $inidir/STE0072_C31.ini
#cp $inifile $inidir/STE0072_SC12A.ini
#cp $inifile $inidir/STE0072_SC23B.ini
#cp $inifile $inidir/STE0072_SC31A.ini
#cp $inifile $inidir/STE0076_C12.ini
#cp $inifile $inidir/STE0076_C23.ini
#cp $inifile $inidir/STE0076_C32.ini
#cp $inifile $inidir/STE0076_SC12C.ini
#cp $inifile $inidir/STE0076_SC23A.ini
#cp $inifile $inidir/STE0076_SC32A.ini
#cp $inifile $inidir/C30913D_C10.ini
#cp $inifile $inidir/C30913D_C12.ini
#cp $inifile $inidir/C30913D_SC109.ini
#cp $inifile $inidir/C30913D_SC125.ini
#cp $inifile $inidir/17513D_C10.ini
#cp $inifile $inidir/17513D_C3.ini
#cp $inifile $inidir/17513D_SC105.ini
#cp $inifile $inidir/17513D_SC33.ini
#cp $inifile $inidir/IPS_C_A1.ini
#cp $inifile $inidir/IPS_C_A3.ini
#cp $inifile $inidir/IPS_C_B3.ini
#cp $inifile $inidir/IPS_SC_A1.ini
#cp $inifile $inidir/IPS_SC_A3.ini
#cp $inifile $inidir/IPS_SC_B3.ini
#cp $inifile $inidir/IPS_CLONEHA1.ini
#cp $inifile $inidir/IPS_HA1SUBCLONE3.ini
#cp $inifile $inidir/MASEVREF_CLONEN4SUBCLONE1.ini
#cp $inifile $inidir/MASEVREF_CLONEH2SUBCLONE2.ini
#cp $inifile $inidir/MASEVREF_CLONEN4.ini
#cp $inifile $inidir/MASEVREF_CLONEH2.ini
#cp $inifile $inidir/H9BULK_H9CLONEH2.ini
#cp $inifile $inidir/H9BULK_H9CLONEH2SUBCLONE2.ini
#cp $inifile $inidir/H9BULK_H9CLONEN2.ini
#cp $inifile $inidir/H9BULK_H9CLONEN2SUBCLONE3.ini
#


cp $inidir/STE0072_C12.ini runs/STE0072/STE0072_C12/STE0072_C12.ini
cp $inidir/STE0072_C23.ini runs/STE0072/STE0072_C23/STE0072_C23.ini
cp $inidir/STE0072_C31.ini runs/STE0072/STE0072_C31/STE0072_C31.ini
cp $inidir/STE0072_SC12A.ini runs/STE0072/STE0072_SC12A/STE0072_SC12A.ini
cp $inidir/STE0072_SC23B.ini runs/STE0072/STE0072_SC23B/STE0072_SC23B.ini
cp $inidir/STE0072_SC31A.ini runs/STE0072/STE0072_SC31A/STE0072_SC31A.ini
cp $inidir/STE0076_C12.ini runs/STE0076/STE0076_C12/STE0076_C12.ini
cp $inidir/STE0076_C23.ini runs/STE0076/STE0076_C23/STE0076_C23.ini
cp $inidir/STE0076_C32.ini runs/STE0076/STE0076_C32/STE0076_C32.ini
cp $inidir/STE0076_SC12C.ini runs/STE0076/STE0076_SC12C/STE0076_SC12C.ini
cp $inidir/STE0076_SC23A.ini runs/STE0076/STE0076_SC23A/STE0076_SC23A.ini
cp $inidir/STE0076_SC32A.ini runs/STE0076/STE0076_SC32A/STE0076_SC32A.ini
cp $inidir/C30913D_C10.ini runs/C30913D/C30913D_C10/C30913D_C10.ini
cp $inidir/C30913D_C12.ini runs/C30913D/C30913D_C12/C30913D_C12.ini
cp $inidir/C30913D_SC109.ini runs/C30913D/C30913D_SC109/C30913D_SC109.ini
cp $inidir/C30913D_SC125.ini runs/C30913D/C30913D_SC125/C30913D_SC125.ini
cp $inidir/17513D_C10.ini runs/17513D/17513D_C10/17513D_C10.ini
cp $inidir/17513D_C3.ini runs/17513D/17513D_C3/17513D_C3.ini
cp $inidir/17513D_SC105.ini runs/17513D/17513D_SC105/17513D_SC105.ini
cp $inidir/17513D_SC33.ini runs/17513D/17513D_SC33/17513D_SC33.ini
cp $inidir/IPS_C_A1.ini runs/IPS/IPS_C_A1/IPS_C_A1.ini
cp $inidir/IPS_C_A3.ini runs/IPS/IPS_C_A3/IPS_C_A3.ini
cp $inidir/IPS_C_B3.ini runs/IPS/IPS_C_B3/IPS_C_B3.ini
cp $inidir/IPS_SC_A1.ini runs/IPS/IPS_SC_A1/IPS_SC_A1.ini
cp $inidir/IPS_SC_A3.ini runs/IPS/IPS_SC_A3/IPS_SC_A3.ini
cp $inidir/IPS_SC_B3.ini runs/IPS/IPS_SC_B3/IPS_SC_B3.ini
cp $inidir/IPS_CLONEHA1.ini runs/IPS/IPS_CLONEHA1/IPS_CLONEHA1.ini
cp $inidir/IPS_HA1SUBCLONE3.ini runs/IPS/IPS_HA1SUBCLONE3/IPS_HA1SUBCLONE3.ini
cp $inidir/MASEVREF_CLONEN4SUBCLONE1.ini runs/MASEV/MASEVREF_CLONEN4SUBCLONE1/MASEVREF_CLONEN4SUBCLONE1.ini
cp $inidir/MASEVREF_CLONEH2SUBCLONE2.ini runs/MASEV/MASEVREF_CLONEH2SUBCLONE2/MASEVREF_CLONEH2SUBCLONE2.ini
cp $inidir/MASEVREF_CLONEN4.ini runs/MASEV/MASEVREF_CLONEN4/MASEVREF_CLONEN4.ini
cp $inidir/MASEVREF_CLONEH2.ini runs/MASEV/MASEVREF_CLONEH2/MASEVREF_CLONEH2.ini

cp $inidir/H9BULK_H9CLONEH2.ini runs/H9/H9BULK_H9CLONEH2/H9BULK_H9CLONEH2.ini
cp $inidir/H9BULK_H9CLONEH2SUBCLONE2.ini runs/H9/H9BULK_H9CLONEH2SUBCLONE2/H9BULK_H9CLONEH2SUBCLONE2.ini
cp $inidir/H9BULK_H9CLONEN2.ini runs/H9/H9BULK_H9CLONEN2/H9BULK_H9CLONEN2.ini
cp $inidir/H9BULK_H9CLONEN2SUBCLONE3.ini runs/H9/H9BULK_H9CLONEN2SUBCLONE3/H9BULK_H9CLONEN2SUBCLONE3.ini
#
#
#
#submit
SNVFIrunscript=/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/scripts/somatic_calling_SNVfi/SNVfi_AVH.sh
SNVFIconfigfile=/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/scripts/somatic_calling_SNVfi/SNVFI_default.config


cd /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/runs/

find "$(pwd)" -iname "*ini" | while read ini_file
do
	echo $ini_file
	filename=$(basename -- "$ini_file")
	filename="${filename%.*}"
	directname=$(dirname -- "$ini_file")
	echo $filename
	echo $directname
	
	
	job_name=${directname}/RUNSNVFI_${filename}.job
	if [[ ! -p $job_name ]]; then
		touch $job_name
	fi
	
	echo sh $SNVFIrunscript $SNVFIconfigfile $ini_file > $job_name
	
	qsub -S /bin/bash -N SNVfi -cwd -o $directname/output_job_${filename}.txt -e $directname/error_job_${filename}.txt -M a.vanhoeck@umcutrecht.nl -m a -l h_rt=2:00:00 -l h_vmem=20G $job_name

done
