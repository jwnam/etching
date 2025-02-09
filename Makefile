default:
	bash checkreq.sh
	bash libconf.sh
	cd lib/zlib && make
	cd lib/gzstream && make
	cd lib/bamtools && make
	cd ETCHING && make
	cd Filter && make
	cd Caller && make
	cd Sorter && make
	cd FG_identifier && make
	if [ ! -d "bin" ]; then mkdir bin ; fi
	cp ETCHING/etching bin/
	cp Filter/etching_filter bin/
	cp Filter/kmer_filter bin/
	cp Filter/read_collector bin/
	cp Filter/KMC3/kmc* bin/
	cp Filter/fastq_check bin/
	cp Filter/sort_fastq_mem_eff bin/
	cp Filter/match_pair bin/
	cp Filter/find_local_min_kmer_depth bin/
	cp Filter/make_pgk bin/
	cp Caller/etching_caller bin/
	cp Caller/etching_typer bin/
	cp Caller/somatic_filter bin/
	cp Caller/target_filter bin/
	cp Caller/extract_BP_read bin/
	cp Sorter/etching_sorter bin/
	cp Sorter/scorer_RandomForest bin/
	cp Sorter/scorer_XGBoost bin/
	cp Sorter/cut_by_score bin/
	cp Sorter/cut_by_length bin/
	cp FG_identifier/etching_fg_identifier bin/
	cp -ar ETCHING_ML_model bin/
	bash decomp.sh
	bash build_etching_venv.sh

all: library default


clean:
	rm -rf bin/*
	cd ETCHING && make clean
	cd Filter && make clean
	cd Caller && make clean
	cd Sorter && make clean
	cd FG_identifier && make clean

cleanall: clean
	cd ETCHING && make cleanall
	cd Filter && make cleanall
	cd Caller && make cleanall
	cd Sorter && make cleanall
	cd FG_identifier && make cleanall
	cd lib/gzstream && make clean
	cd lib/zlib && make clean
	cd lib/bamtools && make clean
	rm -rf bin lib/lib* lib/python* lib64 get-pip.py .python-version pyvenv.cfg
