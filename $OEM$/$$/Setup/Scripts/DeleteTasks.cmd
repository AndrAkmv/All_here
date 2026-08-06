@echo off

schtasks /Delete /tn "\Microsoft\Office\Office 15 Subscription Heartbeat" /f                                  &rem - 9 B - -
schtasks /Delete /tn "\Microsoft\Office\Office Automatic Updates 2.0" /f                                      &rem - - - C D
schtasks /Delete /tn "\Microsoft\Office\Office ClickToRun Service Monitor" /f                                 &rem - - - C D
schtasks /Delete /tn "\Microsoft\Office\OfficeBackgroundTaskHandlerLogon" /f                                  &rem - - - C -
schtasks /Delete /tn "\Microsoft\Office\OfficeBackgroundTaskHandlerRegistration" /f                           &rem - - - C -
schtasks /Delete /tn "\Microsoft\Office\Office Feature Updates" /f                                            &rem - - - - D
schtasks /Delete /tn "\Microsoft\Office\Office Feature Updates Logon" /f                                      &rem - - - - d
schtasks /Delete /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /f                                  &rem - - - C -
schtasks /Delete /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /f                                     &rem - - - C -

schtasks /Delete /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /f                                        &rem - 9 B - -
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\AitAgent" /f                                  &rem 7 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\MareBackup" /f                                &rem - - - - d
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f         &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /f                            &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\PcaWallpaperAppDetect" /f                     &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /f                        &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /f                            &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\ApplicationData\appuriverifierdaily" /f                              &rem - - B C d
schtasks /Delete /tn "\Microsoft\Windows\ApplicationData\appuriverifierinstall" /f                            &rem - - B c d
schtasks /Delete /tn "\Microsoft\Windows\AppListBackup\Backup" /f                                             &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\AppListBackup\BackupNonMaintenance" /f                               &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup" /f                      &rem - 8 b c d
schtasks /Delete /tn "\Microsoft\Windows\AppxDeploymentClient\UCPD velocity" /f                               &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\Autochk\Proxy" /f                                                    &rem 7 9 B C D

schtasks /Delete /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /f                             &rem - - b C D
schtasks /Delete /tn "\Microsoft\Windows\CloudRestore\Backup" /f                                              &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\ConsentUX\UnifiedConsent\UnifiedConsentSyncTask" /f                  &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /f                   &rem - 8 - - -
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f             &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /f           &rem 7 9 B - -
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f                  &rem 7 8 B C D

schtasks /Delete /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /f                                           &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Device Information\Device" /f                                        &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\Device Information\Device User" /f                                   &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\Device Setup\Metadata Refresh" /f                                    &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\IntegrityCheck" /f                             &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceAccountChange" /f                &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceConnectedToNetwork" /f           &rem - - B - -
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic1" /f                    &rem - - B - -
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic24" /f                   &rem - - B c d
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic6" /f                    &rem - - B - -
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterUserDevice" /f                         &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /f                      &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\Diagnosis\Scheduled" /f                                              &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /f     &rem 7 9 B C D

schtasks /Delete /tn "\Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /f                     &rem - - - C D

schtasks /Delete /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /f                                           &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /f                         &rem - - b c d
schtasks /Delete /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /f                      &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /f                        &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /f                        &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /f                       &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\Flighting\OneSettings\RefreshCache" /f                               &rem - - - C D

schtasks /Delete /tn "\Microsoft\Windows\HelloFace\FODCleanupTask" /f                                         &rem - - - C D

schtasks /Delete /tn "\Microsoft\Windows\InstallService\ScanForUpdates" /f                                    &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\InstallService\ScanForUpdatesAsUser" /f                              &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\InstallService\SmartRetry" /f                                        &rem - - - c d
schtasks /Delete /tn "\Microsoft\Windows\International\Synchronize Language Settings" /f                      &rem - - - - D

schtasks /Delete /tn "\Microsoft\Windows\LanguageComponentsInstaller\Installation" /f                         &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /f           &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /f                       &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\License Manager\TempSignedLicenseExchange" /f                        &rem - - B C D

schtasks /Delete /tn "\Microsoft\Windows\Maintenance\WinSAT" /f                                               &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Management\Provisioning\Cellular" /f                                 &rem - - - c d
schtasks /Delete /tn "\Microsoft\Windows\Management\Provisioning\Logon" /f                                    &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /f                   &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /f                         &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /f                    &rem - 8 b c d
schtasks /Delete /tn "\Microsoft\Windows\MobilePC\HotStart" /f                                                &rem 7 - - - -
schtasks /Delete /tn "\Microsoft\Windows\MUI\LPRemove" /f                                                     &rem 7 9 B C D

schtasks /Delete /tn "\Microsoft\Windows\NetCfg\BindingWorkItemQueueHandler" /f                               &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /f                                       &rem 6 8 b c d

schtasks /Delete /tn "\Microsoft\Windows\PI\SecureBootEncodeUEFI" /f                                          &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\PI\Secure-Boot-Update" /f                                            &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /f                       &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Printing\EduPrintProv" /f                                            &rem - - - c d
schtasks /Delete /tn "\Microsoft\Windows\Printing\PrinterCleanupTask" /f                                      &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\PushToInstall\LoginCheck" /f                                         &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\PushToInstall\Registration" /f                                       &rem - - - C D

schtasks /Delete /tn "\Microsoft\Windows\RAC\RacTask" /f                                                      &rem 7 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\Ras\MobilityManager" /f                                              &rem 6 8 b c d
schtasks /Delete /tn "\Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /f                                  &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Registry\RegIdleBackup" /f                                           &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /f                            &rem 6 8 b c d
schtasks /Delete /tn "\Microsoft\Windows\RetailDemo\CleanupOfflineContent" /f                                 &rem - - B C D

schtasks /Delete /tn "\Microsoft\Windows\SettingSync\BackgroundUploadTask" /f                                 &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\SettingSync\BackupTask" /f                                           &rem - 9 B - -
schtasks /Delete /tn "\Microsoft\Windows\SettingSync\NetworkStateChangeTask" /f                               &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Setup\EOSNotify" /f                                                  &rem 7 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\Setup\EOSNotify2" /f                                                 &rem 7 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\Setup\SetupCleanupTask" /f                                           &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Shell\CreateObjectTask" /f                                           &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /f                                        &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /f                                    &rem - - b c d
schtasks /Delete /tn "\Microsoft\Windows\SkyDrive\Idle Sync Maintenance Task" /f                              &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\SkyDrive\Routine Maintenance Task" /f                                &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\Speech\HeadsetButtonPress" /f                                        &rem - - - c -
schtasks /Delete /tn "\Microsoft\Windows\Speech\SpeechModelDownloadTask" /f                                   &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" /f                                       &rem - - B C d
schtasks /Delete /tn "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /f                                     &rem - 9 B C d
schtasks /Delete /tn "\Microsoft\Windows\SystemRestore\SR" /f                                                 &rem 7 9 B C D

schtasks /Delete /tn "\Microsoft\Windows\TaskScheduler\Idle Maintenance" /f                                   &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\TaskScheduler\Maintenance Configurator" /f                           &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\TaskScheduler\Regular Maintenance" /f                                &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /f                             &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Time Zone\SynchronizeTimeZone" /f                                    &rem - 9 B C D

schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\Reboot" /f                                        &rem - - b - -
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\Refresh Settings" /f                              &rem - - B - -
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /f                                 &rem - - B C D
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work" /f                      &rem - - - - D
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\UpdateModelTask" /f                               &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /f                                  &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker_Display" /f                          &rem - - b - -
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker_ReadyToReboot" /f                    &rem - - b - -

schtasks /Delete /tn "\Microsoft\Windows\WaaSMedic\PerformRemediation" /f                                     &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\WDI\ResolutionHost" /f                                               &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Windows Activation Technologies\ValidationTask" /f                   &rem 7 - - - -
schtasks /Delete /tn "\Microsoft\Windows\Windows Activation Technologies\ValidationTaskDeadline" /f           &rem 7 - - - -
schtasks /Delete /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /f              &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /f                        &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /f                 &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Windows Defender\Windows Defender Verification" /f                   &rem - 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /f                           &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /f           &rem 6 8 b c d
schtasks /Delete /tn "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /f                              &rem 6 8 b c d
schtasks /Delete /tn "\Microsoft\Windows\WindowsBackup\ConfigNotification" /f                                 &rem 7 - - - -
schtasks /Delete /tn "\Microsoft\Windows\WindowsColorSystem\Calibration Loader" /f                            &rem 6 8 B C D
schtasks /Delete /tn "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /f                               &rem - - B - -
schtasks /Delete /tn "\Microsoft\Windows\WindowsUpdate\sih" /f                                                &rem - - B - -
schtasks /Delete /tn "\Microsoft\Windows\WindowsUpdate\sihboot" /f                                            &rem - - b - -
schtasks /Delete /tn "\Microsoft\Windows\Wininet\CacheTask" /f                                                &rem 7 9 B C D
schtasks /Delete /tn "\Microsoft\Windows\WlanSvc\CDSSync" /f                                                  &rem - - - C D
schtasks /Delete /tn "\Microsoft\Windows\WS\Badge Update" /f                                                  &rem - 8 - - -
schtasks /Delete /tn "\Microsoft\Windows\WS\License Validation" /f                                            &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\WS\WSRefreshBannedAppsListTask" /f                                   &rem - 9 - - -
schtasks /Delete /tn "\Microsoft\Windows\WwanSvc\OobeDiscovery" /f                                            &rem - - - - D

schtasks /Delete /tn "\Microsoft\XblGameSave\XblGameSaveTask" /f                                              &rem - - B c d
schtasks /Delete /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /f                                         &rem - - B - -

timeout 3 > nul
