#
# Makefile
#
# The global Makefile for POCO [generated by mkrelease]
#

sinclude config.make
sinclude config.build

ifndef POCO_BASE
$(warning WARNING: POCO_BASE is not defined. Assuming current directory.)
export POCO_BASE=$(shell pwd)
endif

ifndef POCO_PREFIX
export POCO_PREFIX=/usr/local
endif

ifndef POCO_BUILD
export POCO_BUILD=$(POCO_BASE)
endif

.PHONY: poco all libexecs cppunit tests samples cleans clean distclean install

# TESTS and SAMPLES are set in config.make
poco: libexecs $(if $(TESTS),tests) $(if $(SAMPLES),samples) 
all: libexecs tests samples

INSTALLDIR = $(DESTDIR)$(POCO_PREFIX)
COMPONENTS = Foundation XML JSON Util Net Crypto NetSSL_OpenSSL Data Data/SQLite Data/ODBC Data/MySQL MongoDB Zip PageCompiler PageCompiler/File2Page

cppunit:
	$(MAKE) -C $(POCO_BASE)/CppUnit 

CppUnit-clean:
	\$(MAKE) -C \$(POCO_BASE)/CppUnit clean

install: libexecs
	mkdir -p $(INSTALLDIR)/include/Poco
	mkdir -p $(INSTALLDIR)/lib
	mkdir -p $(INSTALLDIR)/bin
	for comp in $(COMPONENTS) ; do \
		if [ -d "$(POCO_BASE)/$$comp/include" ] ; then \
			cp -Rf $(POCO_BASE)/$$comp/include/* $(INSTALLDIR)/include/ ; \
		fi ; \
		if [ -d "$(POCO_BUILD)/$$comp/bin" ] ; then \
			find $(POCO_BUILD)/$$comp/bin -perm -700 -type f -exec cp -f {} $(INSTALLDIR)/bin \; ; \
		fi ; \
	done
	find $(POCO_BUILD)/lib -name "libPoco*" -type f -exec cp -f {} $(INSTALLDIR)/lib \;
	find $(POCO_BUILD)/lib -name "libPoco*" -type l -exec cp -Rf {} $(INSTALLDIR)/lib \;

libexecs =  Foundation-libexec XML-libexec JSON-libexec Util-libexec Net-libexec Crypto-libexec NetSSL_OpenSSL-libexec Data-libexec Data/SQLite-libexec Data/ODBC-libexec Data/MySQL-libexec MongoDB-libexec Zip-libexec PageCompiler-libexec PageCompiler/File2Page-libexec
tests    =  Foundation-tests XML-tests JSON-tests Util-tests Net-tests Crypto-tests NetSSL_OpenSSL-tests Data-tests Data/SQLite-tests Data/ODBC-tests Data/MySQL-tests MongoDB-tests Zip-tests
samples  =  Foundation-samples XML-samples JSON-samples Util-samples Net-samples Crypto-samples NetSSL_OpenSSL-samples Data-samples MongoDB-samples Zip-samples PageCompiler-samples
cleans   =  Foundation-clean XML-clean JSON-clean Util-clean Net-clean Crypto-clean NetSSL_OpenSSL-clean Data-clean Data/SQLite-clean Data/ODBC-clean Data/MySQL-clean MongoDB-clean Zip-clean PageCompiler-clean PageCompiler/File2Page-clean

.PHONY: $(libexecs)
.PHONY: $(tests)
.PHONY: $(samples)
.PHONY: $(cleans)

libexecs: $(filter-out $(foreach f,$(OMIT),$f%),$(libexecs))
tests: $(filter-out $(foreach f,$(OMIT),$f%),$(tests))
samples: $(filter-out $(foreach f,$(OMIT),$f%),$(samples))
cleans: $(filter-out $(foreach f,$(OMIT),$f%),$(cleans))

Foundation-libexec: 
	$(MAKE) -C $(POCO_BASE)/Foundation

Foundation-tests: Foundation-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Foundation/testsuite
	
Foundation-samples: Foundation-libexec 
	$(MAKE) -C $(POCO_BASE)/Foundation/samples

Foundation-clean:
	$(MAKE) -C $(POCO_BASE)/Foundation clean
	$(MAKE) -C $(POCO_BASE)/Foundation/testsuite clean
	$(MAKE) -C $(POCO_BASE)/Foundation/samples clean

XML-libexec:  Foundation-libexec
	$(MAKE) -C $(POCO_BASE)/XML

XML-tests: XML-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/XML/testsuite
	
XML-samples: XML-libexec 
	$(MAKE) -C $(POCO_BASE)/XML/samples

XML-clean:
	$(MAKE) -C $(POCO_BASE)/XML clean
	$(MAKE) -C $(POCO_BASE)/XML/testsuite clean
	$(MAKE) -C $(POCO_BASE)/XML/samples clean

JSON-libexec:  Foundation-libexec
	$(MAKE) -C $(POCO_BASE)/JSON

JSON-tests: JSON-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/JSON/testsuite
	
JSON-samples: JSON-libexec 
	$(MAKE) -C $(POCO_BASE)/JSON/samples

JSON-clean:
	$(MAKE) -C $(POCO_BASE)/JSON clean
	$(MAKE) -C $(POCO_BASE)/JSON/testsuite clean
	$(MAKE) -C $(POCO_BASE)/JSON/samples clean

Util-libexec:  Foundation-libexec XML-libexec JSON-libexec
	$(MAKE) -C $(POCO_BASE)/Util

Util-tests: Util-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Util/testsuite
	
Util-samples: Util-libexec 
	$(MAKE) -C $(POCO_BASE)/Util/samples

Util-clean:
	$(MAKE) -C $(POCO_BASE)/Util clean
	$(MAKE) -C $(POCO_BASE)/Util/testsuite clean
	$(MAKE) -C $(POCO_BASE)/Util/samples clean

Net-libexec:  Foundation-libexec
	$(MAKE) -C $(POCO_BASE)/Net

Net-tests: Net-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Net/testsuite
	
Net-samples: Net-libexec  Foundation-libexec XML-libexec Util-libexec
	$(MAKE) -C $(POCO_BASE)/Net/samples

Net-clean:
	$(MAKE) -C $(POCO_BASE)/Net clean
	$(MAKE) -C $(POCO_BASE)/Net/testsuite clean
	$(MAKE) -C $(POCO_BASE)/Net/samples clean

Crypto-libexec:  Foundation-libexec
	$(MAKE) -C $(POCO_BASE)/Crypto

Crypto-tests: Crypto-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Crypto/testsuite
	
Crypto-samples: Crypto-libexec  Foundation-libexec Util-libexec
	$(MAKE) -C $(POCO_BASE)/Crypto/samples

Crypto-clean:
	$(MAKE) -C $(POCO_BASE)/Crypto clean
	$(MAKE) -C $(POCO_BASE)/Crypto/testsuite clean
	$(MAKE) -C $(POCO_BASE)/Crypto/samples clean

NetSSL_OpenSSL-libexec:  Foundation-libexec Net-libexec Util-libexec Crypto-libexec
	$(MAKE) -C $(POCO_BASE)/NetSSL_OpenSSL

NetSSL_OpenSSL-tests: NetSSL_OpenSSL-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/NetSSL_OpenSSL/testsuite
	
NetSSL_OpenSSL-samples: NetSSL_OpenSSL-libexec 
	$(MAKE) -C $(POCO_BASE)/NetSSL_OpenSSL/samples

NetSSL_OpenSSL-clean:
	$(MAKE) -C $(POCO_BASE)/NetSSL_OpenSSL clean
	$(MAKE) -C $(POCO_BASE)/NetSSL_OpenSSL/testsuite clean
	$(MAKE) -C $(POCO_BASE)/NetSSL_OpenSSL/samples clean

Data-libexec:  Foundation-libexec
	$(MAKE) -C $(POCO_BASE)/Data

Data-tests: Data-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Data/testsuite
	
Data-samples: Data-libexec  Data-libexec Data/SQLite-libexec
	$(MAKE) -C $(POCO_BASE)/Data/samples

Data-clean:
	$(MAKE) -C $(POCO_BASE)/Data clean
	$(MAKE) -C $(POCO_BASE)/Data/testsuite clean
	$(MAKE) -C $(POCO_BASE)/Data/samples clean

Data/SQLite-libexec:  Foundation-libexec Data-libexec
	$(MAKE) -C $(POCO_BASE)/Data/SQLite

Data/SQLite-tests: Data/SQLite-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Data/SQLite/testsuite

Data/SQLite-clean:
	$(MAKE) -C $(POCO_BASE)/Data/SQLite clean
	$(MAKE) -C $(POCO_BASE)/Data/SQLite/testsuite clean

Data/ODBC-libexec:  Foundation-libexec Data-libexec
	$(MAKE) -C $(POCO_BASE)/Data/ODBC

Data/ODBC-tests: Data/ODBC-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Data/ODBC/testsuite

Data/ODBC-clean:
	$(MAKE) -C $(POCO_BASE)/Data/ODBC clean
	$(MAKE) -C $(POCO_BASE)/Data/ODBC/testsuite clean

Data/MySQL-libexec:  Foundation-libexec Data-libexec
	$(MAKE) -C $(POCO_BASE)/Data/MySQL

Data/MySQL-tests: Data/MySQL-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Data/MySQL/testsuite

Data/MySQL-clean:
	$(MAKE) -C $(POCO_BASE)/Data/MySQL clean
	$(MAKE) -C $(POCO_BASE)/Data/MySQL/testsuite clean

MongoDB-libexec:  Foundation-libexec Net-libexec
	$(MAKE) -C $(POCO_BASE)/MongoDB

MongoDB-tests: MongoDB-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/MongoDB/testsuite
	
MongoDB-samples: MongoDB-libexec 
	$(MAKE) -C $(POCO_BASE)/MongoDB/samples

MongoDB-clean:
	$(MAKE) -C $(POCO_BASE)/MongoDB clean
	$(MAKE) -C $(POCO_BASE)/MongoDB/testsuite clean
	$(MAKE) -C $(POCO_BASE)/MongoDB/samples clean

Zip-libexec:  Foundation-libexec Net-libexec Util-libexec XML-libexec
	$(MAKE) -C $(POCO_BASE)/Zip

Zip-tests: Zip-libexec cppunit
	$(MAKE) -C $(POCO_BASE)/Zip/testsuite
	
Zip-samples: Zip-libexec 
	$(MAKE) -C $(POCO_BASE)/Zip/samples

Zip-clean:
	$(MAKE) -C $(POCO_BASE)/Zip clean
	$(MAKE) -C $(POCO_BASE)/Zip/testsuite clean
	$(MAKE) -C $(POCO_BASE)/Zip/samples clean

PageCompiler-libexec:  Net-libexec Util-libexec XML-libexec Foundation-libexec
	$(MAKE) -C $(POCO_BASE)/PageCompiler
	
PageCompiler-samples: PageCompiler-libexec 
	$(MAKE) -C $(POCO_BASE)/PageCompiler/samples

PageCompiler-clean:
	$(MAKE) -C $(POCO_BASE)/PageCompiler clean
	$(MAKE) -C $(POCO_BASE)/PageCompiler/samples clean

PageCompiler/File2Page-libexec:  Net-libexec Util-libexec XML-libexec Foundation-libexec
	$(MAKE) -C $(POCO_BASE)/PageCompiler/File2Page

PageCompiler/File2Page-clean:
	$(MAKE) -C $(POCO_BASE)/PageCompiler/File2Page clean

clean: cleans CppUnit-clean

distclean:
	rm -rf $(POCO_BUILD)/lib
	find $(POCO_BUILD) -name obj -type d -print0 | xargs -0 rm -rf
	find $(POCO_BUILD) -name .dep -type d -print0 | xargs -0 rm -rf
	find $(POCO_BUILD) -name bin -type d -print0 | xargs -0 rm -rf
